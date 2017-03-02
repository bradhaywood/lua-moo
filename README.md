# moo.lua
### The little lua class builder library

## INTRODUCTION
Moonscript seemed like a cool idea, but I hated the syntax. I'm doing Lua because I enjoy Lua - I'm not interested in learning another language. So I attempted to 
take the garbage Lua that Moonscript generates and move it into a library. That way, you can still write Lua and not have to worry about doing the 
metatable dance yourself.
You'll find examples in the main directory (ie: All the Koopa stuff). I'll give a short synopsis to try and explain how it works.

## SYNOPSIS

To create a class (or package as moo refers to them as) just use the `package` function

```lua
-- koopa.lua
require "moo"

package("Koopa")
```

You now have a metatable called `Koopa`. Though it's not very useful. So, let's add some properties to it.

```lua
require "moo"

package("Koopa",
  { Name = "Koopa", CanBounce = false, ReverseAtEnd = false })
  
```

Now our Koopa class can assign a name, return if it can bounce or not, and tell us if it reverse when it reaches a cliff. 
You can use inheritance to create new Koopa classes that inherit the base (parent) Koopa class. This will give your new Koopas the default properties of Koopa 
while allowing you to override them, giving each Koopa a unique set of properties.

```lua
-- green_koopa.lua

require "moo"
require "koopa"

package("GreenKoopa"):extends(Koopa()) -- Koopa() will return the Koopa metatable

-- We're happy with the defaults of the Koopa class, but 
-- obviously want to change the name!

GreenKoopa:has("Name", "Green Koopa")
```

We've used two new methods in the above example, `extends` and `has`. `extends` will tell our class to inherit the object you pass to it, and `has` is used to override the properties. 
That's basically all there is to it.

You can easily loop through the children of a base class.

```lua
-- test.lua
require "koopa"
require "green_koopa" -- don't forget to load the other koopas

print("Found " .. #Koopa.children .. " koopas!")

for _, k in pairs(Koopa.children) do
  print("Name: " .. k.Name)
  print("Can bounce: " .. tostring(k.CanBounce))
end
```

If you don't need or want direct access to the parent, you don't even have to include the koopa base

```lua
-- test.lua
require "green_koopa"

print("Green Koopa's name is " .. GreenKoopa.Name)
```

## LICENSE

Copyright 2017 Brad Haywood

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
