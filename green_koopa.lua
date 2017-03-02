require "moo"
require "koopa"

local koopa = package("GreenKoopa"):extends(Koopa())

-- We're happy with the other defaults, but want to change the name
GreenKoopa:has("Name", "Green Koopa")