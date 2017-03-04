require "moo"

Koopa = class:new()

Koopa.CanBounce = false
Koopa.ReverseAtEnd = false

function Koopa:GetMyName()
  return self.Name or "No Name"
end


