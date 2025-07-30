--This sets Potato as a reference to the class file
--Note the capital letter - common practice for Class referencing
local Potato = require( "potatoClass" )

-- Helper function for demonstration output
local function demo(title, func)
   print("\n=== " .. title .. " ===")
   local success, result = pcall(func)
   if not success then
      print("ERROR: " .. result)
   end
   print("========================")
end

-- Demo 1: Basic Potato Creation and Usage
demo("Basic Potato Operations", function()
   --This creates a new local Potato object from the class
   local myLittlePotato = Potato:new()
   
   print("Initial state: " .. myLittlePotato:toString())
   print("Type:", myLittlePotato.type)             -- Rooster
   print("Grow to:", myLittlePotato:grow(5))       -- 6
   print("Shrink to:", myLittlePotato:shrink(4))   -- 2
   print("Size is now:", myLittlePotato:getSize()) -- 2
   myLittlePotato:sing()
   
   -- Give it a proper name
   myLittlePotato:giveName("Spudrick")
end)

-- Demo 2: Custom Methods (Extension)
demo("Custom Method Extension", function()
   local myLittlePotato = Potato:new()
   
   --This :eat() method doesn't exist in the Potato 'class' but it's easy to extend!
   --Note that this new method is only available for the myLittlePotato object...
   --or any objects that use this myLittlePotato as its own class - Potato Inception!
   function myLittlePotato:eat()
      self.size = self:shrink( self:getSize() ) -- eat it all!
      return "Nom, Nom. All Gone"
   end
   
   myLittlePotato:grow(3)
   print("Before eating: " .. myLittlePotato:toString())
   print(myLittlePotato:eat())
   print("After eating: " .. myLittlePotato:toString())
end)

-- Demo 3: Inheritance and Method Overriding
demo("Inheritance and Method Overriding", function()
   local parentPotato = Potato:new{ type = "Russet" }
   parentPotato:grow(2)
   
   --I'm still hungry. Let's make another one!
   --This creates a new local Potato object and inherits from parentPotato
   --Note: goldy will inherit the CURRENT values. So it will start with a size of 3.
   local goldy = parentPotato:new{
      type="Golden"
   }
   
   print("Parent: " .. parentPotato:toString())
   print("Child before override: " .. goldy:toString())
   
   --The :grow() method already exists in the Potato class. However...
   --We can override inherited methods just for goldy class objects
   function goldy:grow(amount)
      self.size = self.size + amount * 11 -- But this one goes to 11!
      return self.size
   end
   
   print("Super-Size Me:", goldy:grow(5))   -- Much bigger growth!
   print("Final state: " .. goldy:toString())
   goldy:sing()
end)

-- Demo 4: Cloning
demo("Object Cloning", function()
   local original = Potato:new{ type = "Sweet", size = 10 }
   original:giveName("Original")
   
   local cloned = original:clone()
   cloned:giveName("Clone")
   
   print("Original: " .. original:toString())
   print("Cloned: " .. cloned:toString())
   
   -- Modify clone to show independence
   cloned:grow(5)
   print("After growing clone:")
   print("Original: " .. original:toString())
   print("Cloned: " .. cloned:toString())
end)

-- Demo 5: Error Handling
demo("Error Handling Examples", function()
   local potato = Potato:new()
   
   -- This will work fine
   potato:grow(5)
   print("Valid operation: " .. potato:toString())
   
   -- These will demonstrate error handling
   print("\nTesting error conditions:")
   
   -- Test 1: Invalid shrink amount
   print("Test 1: Trying to shrink more than available...")
   potato:shrink(10) -- This will error
end)

demo("More Error Conditions", function()
   -- Test 2: Invalid constructor input
   print("Test 2: Invalid constructor input...")
   local badPotato = Potato:new("not a table") -- This will error
end)

demo("Even More Error Conditions", function()
   -- Test 3: Invalid method parameters
   print("Test 3: Invalid grow parameter...")
   local potato = Potato:new()
   potato:grow("not a number") -- This will error
end)

print("\n🥔 Demo complete! The Potato class demonstrates:")
print("✓ Metatable-based OOP in Lua")
print("✓ Constructor with validation")  
print("✓ Method inheritance and overriding")
print("✓ Error handling and input validation")
print("✓ Object cloning and extension")
print("✓ Proper encapsulation patterns")
