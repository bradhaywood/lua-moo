require "moo"
require "koopa"

GreenKoopa = class:extends(Koopa)

-- We're happy with the other defaults, but want to change the name
GreenKoopa.Name = "Green Koopa"

function GreenKoopa:GetMyName()
  return "I'm a flipping turtle"
end
