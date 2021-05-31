--This sets Potato as a reference to the class file
--Note the capital letter - common practice for Class referencing
local Potato = require( "potatoClass" )

--This creates a new local Potato object from the class
local myLittlePotato = Potato:new()

--This :eat() method doesn't exist in the Potato 'class' but it's easy to extend!
--Note that this new method is only available for the myLittlePotato object...
--or any objects that use this myLittlePotato as its own class - Potato Inception!
function myLittlePotato:eat()
self.size = self:shrink( self:getSize() ) -- eat it all!
      return "Nom, Nom. All Gone"
end

print( "My Little Potato" )
print( "Type:", myLittlePotato.type )             -- Rooster
print( "Grow to:", myLittlePotato:grow(5) )       -- 6
print( "Shrink to:", myLittlePotato:shrink(4) )   -- 2
print( "Size is now:", myLittlePotato:getSize() ) -- 2
myLittlePotato:sing()
print( "----------------------" )

--I'm still hungry. Let's make another one!
--This creates a new local Potato object and inherits from myLittlePotato
--Note: goldy will inherit the CURRENT values. So it will start with a size of 2.
local goldy = myLittlePotato:new{
   type="Golden"
}

--The :grow() method already exists in the Potato class. However...
--We can override inherited methods just for goldy class objects - sorry myLittlePotato
function goldy:grow(amount)
   self.size = self.size + amount * 11 -- But this one goes to 11!
   return self.size
end

print( "Goldy" )
print( "Type:", goldy.type )              -- Golden
print( "Super-Size Me:", goldy:grow(50) ) -- 50
print( "Shrink to:", goldy:shrink(12) )   -- 51
print( goldy:eat() )                      -- Nom, Nom. All Gone
print( "Size is now:", goldy:getSize() )  -- 0
goldy:sing()
print( "----------------------" )
