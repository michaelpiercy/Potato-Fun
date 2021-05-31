local Potato = {
   type="Rooster", -- default properties.
   size=1
}

--This is our constructor method.
--We should call this method when creating a new instance.
function Potato:new( ... )

   --First we'll make a local table. This will eventually be our new potato.
   --Let's assign the passed arguments(...) as its value or else emptiness.
   local newSpud = ... or {}

   --The Tricky bit. We need to assign our newSpud to have a metatable.
   --Essentially, passing 'self' means our newSpud inherits the same methods as Potato (from above).
   setmetatable( newSpud, self )

   --Once the metatable is assigned, we need to set it to the __index field.
   self.__index = self --in this case it's the Potato itself - but not always.

   --And that's it for the confusing bit. Now we have a 'class'.

   return newSpud -- Isn't it beautiful!

end

--Add methods that you'd like your newSpud to inherit, assign them to Potato.
--Here's a few I cooked up!
--When you're done, return the Potato.
function Potato:grow( amount )
   self.size = self.size + amount
   return self.size
end


function Potato:shrink( amount )
   if amount > self.size then
      error( "shrunk too much" )
   else
      self.size = self.size - amount
   end

   return self.size
end


function Potato:getSize()
   return self.size
end


function Potato:sing()
   if self.type== "Rooster" then
      print("Cockadoodledoo!")
   elseif self.type=="Cake" then
      print("Happy Birthday to yooouuu!")
   else
      print("1 potato, 2 potato, 3 potato, 4")
      print("5 potato, 6 potato, 7 potato, more!")
   end
end


return Potato -- return the Potato object in all its glory!
