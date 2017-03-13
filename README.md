# moo.lua

The little lua class builder library

## INTRODUCTION
Moo.lua is just a small library that performs all the dirty work of building classes (ie: metatables) for you. It can also handle some lightweight instancing and inheritance.

## USAGE

To create a class just use `class:new()`

```lua
-- koopa.lua
require "moo"

Koopa = class:new()
```

You now have a metatable called `Koopa`. Though it's not very useful. So, let's add some properties to it.

```lua
require "moo"

Koopa = class:new()

Koopa.Name = "Koopa"
Koopa.CanBounce = false
Koopa.ReverseAtEnd = false

function Koopa:GetMyName()
  return self.Name or "I have no name"
end
  
```

Now our Koopa class can assign a name, return if it can bounce or not, and tell us if it reverse when it reaches a cliff.

## INHERITANCE

You can use inheritance to create new Koopa classes that inherit the base (parent) Koopa class. This will give your new Koopas the default properties of Koopa 
while allowing you to override them, giving each Koopa a unique set of properties.

```lua
-- green_koopa.lua

require "moo"
require "koopa"

GreenKoopa = class:extends(Koopa)

-- We're happy with the other defaults, but want to change the name
GreenKoopa.Name = "Green Koopa"
```

You can easily loop through the children of a base class.

```lua
-- test.lua
require "koopa"
require "green_koopa" -- don't forget to load the other koopas

print("Found " .. #Koopa.children .. " koopas!")

for _, v in pairs(Koopa.children) do
  print("Name: " .. v:GetMyName()) -- GetMyName() was defined in the base class (Koopa)
  print("Can bounce: " .. tostring(v.CanBounce))
end
```

If you don't need or want direct access to the parent, you don't even have to include the koopa base

```lua
-- test.lua
require "green_koopa"

print("Green Koopa's name is " .. GreenKoopa.Name)
```

## INSTANCING
You can return an **instance** of an object by calling it as a function. Anything you perform on the instance 
will not affect the main table it was instanced from

```lua
require "green_koopa"

local greenKoopa = GreenKoopa()
greenKoopa.Name = "Instanced Green Koopa"

print(greenKoopa.Name) -- outputs: Instanced Green Koopa
print(GreenKoopa.Name) -- outputs: Green Koopa
```

Whenever you initialise an instance you can automatically get it to run a special method called `Initialize`.

```lua
-- green_koopa.lua

GreenKoopa = class:extends(Koopa)

function GreenKoopa:Initialize()
  print("I have been summoned!")
end

-- test.lua

local koopa = GreenKoopa() -- outputs: I have been summoned!
```

The `Initialize` method does support arguments, so you can pass stuff across if you want. Being a method, `self` is also available.

## INTERFACES

This is a pretty light version of interfaces, but it works for the most part. Interfaces are useful for type checking properties created by your classes, and this implemention works on classes that are inheriting also.

```lua
-- koopa.lua

-- create the interface (base properties our class will use)
KoopaTemplate = interface({
	CanBounce = Type.bool,
	ReverseAtEnd = Type.bool,
	Name = Type.string
})

Koopa = class:implements(KoopaTemplate, {
	CanBounce = false,
	ReverseAtEnd = false,
	Name = "Generic Koopa"
})
```

If the `Koopa` class is missing any of the properties defined in the interface, then lua will project an error. If any of the types don't match, it will also error.
To use in inheritance you don't need to do anything abnormal. Just make sure you set the properties in the table rather than using indexing.

```lua
-- red_koopa.lua

RedKoopa = class:extends(Koopa, {
	ReverseAtEnd = true,
	Name = "Red Koopa",
	CanBounce = false
})
```

The above example is the same as doing `RedKoopa.ReverseAtEnd = true`, etc. Except it's quicker to type, and allows the interface to work its magic.

# LICENSE

Copyright 2017 Brad Haywood

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
