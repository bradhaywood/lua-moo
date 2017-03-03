require "moo"
require "koopa"

class("GreenKoopa"):extends(Koopa)

-- We're happy with the other defaults, but want to change the name
GreenKoopa:has("Name", "Green Koopa")

function GreenKoopa:GetMyName()
  return "I'm a flipping turtle"
end
