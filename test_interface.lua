require "moo"

myint = interface({
	name = Type.string,
	status = Type.string,
	yearsWorked = Type.int
})

myclass = class:implements(myint, {
	name = "Brad",
	status = "Unemployed",
	yearsWorked = 5
})