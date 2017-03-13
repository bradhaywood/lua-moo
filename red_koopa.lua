require "moo"
require "koopa"

RedKoopa = class:extends(Koopa, {
	ReverseAtEnd = true,
	Name = "Red Koopa",
	CanBounce = false
})
