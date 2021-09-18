-- First, let's create a table with a bunch of default properties.
-- This is our class definition and will be the returned at the end of the file.
-- But know this! It's its own spud! With its own hopes and dreams.
-- This is what we copy to create instances. It's not what gets returned when we create instances.
local Potato = {
   type="Rooster", -- default properties.
   size=1
}


--This is our constructor method.
--We call this method when we want to return a new instance (object) of our Potato (from above).
function Potato:new( ... )

   --First we'll make a local table. This will eventually be our new potato instance.
   --Let's assign the passed arguments(...) as its value or else emptiness.
   local newSpud = ... or {}

   --The Tricky bit. We need to assign our newSpud to have a metatable.
   --Essentially, passing 'self' means our newSpud inherits a copy of the same methods as Potato (from above).
   setmetatable( newSpud, self )

   --Once the metatable is assigned, we need to set it to the __index field.
   self.__index = self --in this case it's the Potato itself - but not always.

   --And that's it for the confusing bit. Now we have an instance of a "class". Let's release it to the wild.
   return newSpud -- Isn't it beautiful?!

end


--Add methods below that you'd like your newSpuds to inherit and assign the methods to Potato.
--From here on out, do not reference newSpud. It doesn't really exist yet... The universe could implode.
--However, because our newSpuds will inherit these methods, they will become Potato and self.
--Here are a few I cooked up!


--Pass a value argument (known here as the amount parameter) to increase the size property.
--This method also returns the new size value.
function Potato:grow( amount )
   self.size = self.size + amount
   return self.size
end


--Pass a value argument (known here as the amount parameter) to reduce the size property.
--If you try to reduce the size more than is available then you'll get an error.
--This method also returns the new size value.
function Potato:shrink( amount )
   if amount > self.size then
      error( "You tried to shrink too much. I just can't do it, captain!" )
   else
      self.size = self.size - amount
   end

   return self.size
end


--No arguments required to call this method... Though it's fairly pointless.
--One of the beauties of Lua is that you can just access table properties directly. No need for a get method.
--Still, this one returns the size value.
function Potato:getSize()
   return self.size
end


--Pass a string argument (known as realName parameter) to assign a value to the name property.
--This method doesn't return anything, but it annoints us with its life tale so far.
function Potato:giveName( realName )
   self.name = realName
   print("The name's " .. self.name .. " ... " .. self.name .. " Potatoson.")
   print("I'm from the " .. self.type .. " family of potatoes.")
   print("I've grown to the fine auld size of " .. self.size)
end


--No arguments required to call this method.
--A different song is sung...depending on who's askin'!
function Potato:sing()
   if self.type=="Rooster" then
      print("Cockadoodledoo!")
   elseif self.type=="Cake" then
      print("Happy Birthday to Yooouuu!")
   else
      print("1 potato, 2 potato, 3 potato, 4...")
      print("5 potato, 6 potato, 7 potato, more!")
   end
end


return Potato -- return the Potato object in all its glory! Remember, this is the class definition object that is used as a 'template'.
