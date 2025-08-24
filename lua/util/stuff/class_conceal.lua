local conceal_ns = vim.api.nvim_create_namespace("class_conceal")

-- Compile TS query once
local tsx_query
local function get_tsx_query()
  if tsx_query then
    return tsx_query
  end
  local ok, q = pcall(vim.treesitter.query.parse, "tsx", [[
    ((jsx_attribute
        (property_identifier) @att_name (#eq? @att_name "class")
        (string (string_fragment) @class_value)))
  ]])
  if ok then
    tsx_query = q
  end
  return tsx_query
end

-- Debounce per-buffer updates to avoid blocking while typing
local debounce = {} ---@type table<integer, uv_timer_t>

local function update(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Skip big buffers to avoid jank
  local line_count = vim.api.nvim_buf_line_count(bufnr)
  local ok_size, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if line_count > 4000 or (ok_size and stats and stats.size and stats.size > 400 * 1024) then
    vim.api.nvim_buf_clear_namespace(bufnr, conceal_ns, 0, -1)
    return
  end

  local ok_parser, language_tree = pcall(vim.treesitter.get_parser, bufnr, "tsx")
  if not ok_parser or not language_tree then
    return
  end
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  local query = get_tsx_query()
  if not query then
    return
  end

  -- Clear previous extmarks before re-applying
  vim.api.nvim_buf_clear_namespace(bufnr, conceal_ns, 0, -1)

  for _, captures in query:iter_matches(root, bufnr, root:start(), root:end_(), {}) do
    local start_row, start_col, end_row, end_col = captures[2]:range()
    -- Guard against short strings
    local col = math.max(start_col + 3, start_col)
    vim.api.nvim_buf_set_extmark(bufnr, conceal_ns, start_row, col, {
      end_line = end_row,
      end_col = end_col,
      conceal = "%", -- "…",
    })
  end
end

local function schedule_update(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if debounce[bufnr] then
    debounce[bufnr]:stop()
    debounce[bufnr]:close()
    debounce[bufnr] = nil
  end
  local timer = assert(vim.uv.new_timer())
  debounce[bufnr] = timer
  timer:start(150, 0, function()
    -- Run in main loop
    vim.schedule(function()
      if vim.api.nvim_buf_is_loaded(bufnr) then
        update(bufnr)
      end
    end)
  end)
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("class_conceal", { clear = true }),
  pattern = { "*.tsx" },
  callback = function(event)
    schedule_update(event.buf)
  end,
})

-- Lighter updates while editing
vim.api.nvim_create_autocmd({ "TextChangedI", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("class_conceal_edit", { clear = true }),
  pattern = { "*.tsx" },
  callback = function(event)
    schedule_update(event.buf)
  end,
})
