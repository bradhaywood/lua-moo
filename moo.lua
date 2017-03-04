class = {}

local function new(self, o)
  local metaclass = {}
  local base = {
    children = {},
    parent = {}
  }
  if (o ~= nil) then
    for k, v in pairs(o) do
      base[k] = v
    end
  end
  
  -- this is freaking disgusting
  local getName = function()
    for k, v in pairs(_G) do
      if (v == metaclass) then
        return k
      end
    end
  end
  
  local args = {
    Initialize = function() end,
    __base = base,
    __name = getName()
  }
  base.__index = base
  
  metaclass = setmetatable(args, {
    __index = base,
    __call = function(cls, ...)
      local me
      if (cls.parent ~= nil) then
        me = setmetatable(cls.parent, cls)
      else
        me = setmetatable({}, cls)
      end
      cls.Initialize(me, ...)
      return me
    end
  })
  base.__class = metaclass
  local self = metaclass
  return metaclass
end

function class:new(o)
  return new(self, o)
end

function class:extends(par)
  local cls = class:new()
  cls.parent = par
  for k, v in pairs(par) do
    cls[k] = v
  end
  cls.__init = function(self, ...)
    return cls.parent.Initialize(self, ...)
  end
  table.insert(cls.parent.children, cls)
  return cls
end

