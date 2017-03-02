--require "red_koopa"
require "koopa"
require "green_koopa"
require "red_koopa"
require "para_koopa"

print("Found " .. #Koopa.children .. " children of Koopa")
for k, v in pairs(Koopa.children) do
  print("Name: " .. v.Name)
  print("Reverse at end: " .. tostring(v.ReverseAtEnd))
  print("Can Bounce: " .. tostring(v.CanBounce))
  print("--")
end
