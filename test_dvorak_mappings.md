# Testing Dvorak Mappings

## Expected Behavior:

### Word Movement (Dvorak):
- `t` should move to **next word start** (like QWERTY `w`)
- `T` should move to **next WORD start** (like QWERTY `W`)

### Character Finding (Dvorak):
- `l` should **find character before** (like QWERTY `t`)
- `L` should **find character backward before** (like QWERTY `T`)

## Test Cases:

1. **Word Movement Test**:
   - Position cursor at start of: "hello world test"
   - Press `t` → should move to "world"
   - Press `t` → should move to "test"

2. **Character Finding Test**:
   - Position cursor at start of: "hello world"
   - Press `l` then `w` → should move cursor just before the "w" in "world"
   - Press `L` then `h` → should move backward to just before any "h"

## Current Mapping Summary:
```
t → w   (next word start)
T → W   (next WORD start)  
l → t   (find character before)
L → T   (find character backward before)
```

This is the correct implementation of your original Vimscript mappings.