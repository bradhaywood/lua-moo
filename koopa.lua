require "moo"

package("Koopa", {
    CanBounce = false,
    ReverseAtEnd = false
})

function Koopa:GetMyName()
  return self.Name or "No Name"
end


