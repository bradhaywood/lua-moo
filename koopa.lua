require "moo"

Koopa = class:new()

Koopa.CanBounce = false
Koopa.ReverseAtEnd = false

function Koopa:GetMyName()
  return self.Name or "No Name"
end

-- use the initialize args to overwrite the default values
function Koopa:Initialize(a)
	for k,v in pairs(a) do
		self[k] = v
	end
end