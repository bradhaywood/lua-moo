require "moo"
require "koopa"

class("RedKoopa"):extends(Koopa)

-- Red Koopas are a bit smarter than green ones..
RedKoopa:has("ReverseAtEnd", true)

RedKoopa:has("Name", "Red Koopa")