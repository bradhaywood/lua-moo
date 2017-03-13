require "moo"

local mystring = "Hello,there,world!"
local mytable = mystring:split(",")
for k,v in pairs(mytable) do
	print(v)
end

print(join(mytable, " "))