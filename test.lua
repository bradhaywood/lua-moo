--require "red_koopa"
require "koopa"
require "green_koopa"
require "red_koopa"
require "para_koopa"

print("Found " .. #Koopa.children .. " children of Koopa")
for k, v in pairs(Koopa.children) do
  print("Name: " .. v:GetMyName())
  print("Reverse at end: " .. tostring(v.ReverseAtEnd))
  print("Can Bounce: " .. tostring(v.CanBounce))
  print("--")
end

-- Instance test
local parakoopa = ParaKoopa({ Name = "ParaFuckenKoopa"})
print("ParaKoopa reverse at end: " .. tostring(parakoopa.ReverseAtEnd))

-- update the instance
parakoopa.ReverseAtEnd = true
print(tostring(parakoopa.ReverseAtEnd))

-- make sure the original didn't get affected
print(tostring(ParaKoopa.ReverseAtEnd))

-- make sure we got the new name
print(parakoopa.Name)
