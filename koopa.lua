require "moo"

KoopaTemplate = interface({
	CanBounce = Type.bool,
	ReverseAtEnd = Type.bool,
	Name = Type.string
})

Koopa = class:implements(KoopaTemplate,
	{ CanBounce = false, ReverseAtEnd = false, Name = "Generic Koopa" })

function Koopa:GetMyName()
  return self.Name or "No Name"
end

-- use the initialize args to overwrite the default values
function Koopa:Initialize(a)
	for k,v in pairs(a) do
		self[k] = v
	end
end