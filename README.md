# Potato-Fun 🥔

A comprehensive educational micro-project demonstrating advanced metatable usage in Lua for object-oriented programming. While classes don't technically exist in Lua, metatables can be used to create sophisticated class-like behavior with inheritance, method overriding, and proper encapsulation.

## Features

- ✅ **Metatable-based OOP**: Complete class-like behavior using Lua metatables
- ✅ **Input Validation**: Robust error handling and type checking
- ✅ **Inheritance**: Full inheritance support with method overriding
- ✅ **Object Cloning**: Deep copy functionality for object duplication
- ✅ **Method Extension**: Runtime method addition to specific instances
- ✅ **Educational Examples**: Comprehensive demos showing all features

## Quick Start

```bash
# Run the demo
lua main.lua
```

## Code Structure

### `potatoClass.lua`
The core class implementation featuring:
- Constructor with validation (`new()`)
- Instance methods (`grow()`, `shrink()`, `getSize()`, `giveName()`, `sing()`)
- Utility methods (`toString()`, `clone()`)
- Helper validation functions

### `main.lua`
Educational demonstrations including:
- Basic object creation and manipulation
- Method extension and overriding
- Inheritance patterns
- Error handling examples
- Object cloning demonstrations

## Educational Value

This project teaches:

1. **Metatable Mechanics**: How `__index` metamethod enables inheritance
2. **Constructor Patterns**: Best practices for object initialization
3. **Error Handling**: Input validation and graceful error recovery
4. **OOP Concepts**: Encapsulation, inheritance, and polymorphism in Lua
5. **Code Organization**: Proper module structure and separation of concerns

## Usage Examples

### Basic Object Creation
```lua
local Potato = require("potatoClass")
local spud = Potato:new{ type = "Russet", size = 5 }
spud:giveName("My Spud")
print(spud:toString()) -- Potato named My Spud (type: Russet, size: 5)
```

### Inheritance and Method Overriding
```lua
local parent = Potato:new{ type = "Sweet" }
local child = parent:new{ type = "Golden" }

-- Override method for specific instance
function child:grow(amount)
    self.size = self.size + amount * 2  -- Double growth!
    return self.size
end
```

### Error Handling
```lua
-- All methods include proper validation
local potato = Potato:new()
potato:grow(-5)        -- Error: Growth amount must be positive
potato:shrink(100)     -- Error: You tried to shrink too much
potato:giveName(123)   -- Error: Name must be a string
```

## Advanced Features

- **Type Safety**: All methods validate input types and ranges
- **Object Inspection**: `toString()` method for debugging and logging
- **Deep Cloning**: `clone()` method creates independent copies
- **Extensibility**: Easy to add new methods to instances or classes

## Learning Outcomes

After studying this code, you'll understand:
- How Lua metatables simulate class behavior
- Proper error handling in Lua applications
- Object-oriented design patterns in dynamic languages
- Best practices for educational code documentation

## Requirements

- Lua 5.1+ (tested with Lua 5.4)
- No external dependencies required

---

*This project serves as a practical introduction to advanced Lua programming concepts while maintaining readability and educational value.*
