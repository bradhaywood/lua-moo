function package(classname, o)
  local metaclass
  local _base_0 = {}

  if (o ~= nil) then
    for k, v in pairs(o) do
      _base_0[k] = v
      _base_0["Set" .. k] = function(cls, n)
        cls[k] = n
      end
      _base_0["Get" .. k] = function(cls) return cls[k] end
      _base_0["defn"] = function(cls, name, fn)
        local metatable = getmetatable(cls)
        metatable.__index[name] = fn
      end
    end
  end
  _base_0["has"] = function(cls, n, v)
    local metatable = getmetatable(cls)
    metatable[n] = v
  end
  _base_0["children"] = {}
  _base_0["extends"] = function(cls, par)
    local metatable = getmetatable(cls)
    metatable.parent = par--getmetatable(par)
    setmetatable(metatable.__index, par.__base)
    metatable.__index = function(cls, name)
      local val = metatable[name]
      if val == nil then
        local parent = par
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end
    table.insert(metatable.parent.children, cls)
    return metatable
  end

  local args = {
    __init = function() end,
    __base = _base_0,
    __name = classname
  }

  _base_0.__index = _base_0
  metaclass = setmetatable(args, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = metaclass
  local self = metaclass
  _G[classname] = metaclass

  return metaclass
end
