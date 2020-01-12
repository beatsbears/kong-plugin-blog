local kong = kong
local type = type
local match = string.match
local noop = function() end

-- new table
local _M = {}

-- iterate over an array of config values
local function iter(config_array)
  if type(config_array) ~= "table" then
    return noop
  end

  return function(config_array, i)
    i = i + 1

    local header_to_test = config_array[i]
    if header_to_test == nil then
      return nil
    end
    
    return i, header_to_test
  end, config_array, 0
end

function _M.filter(conf, headers)
  
  -- remove configured header if it is found in the response headers
  for _, header_name in iter(conf.remove) do
      kong.response.clear_header(header_name)
  end
end

return _M