local kong = kong
-- Import our class for removing sensitive headers
local hf = require "kong.plugins.hide-token.header_filter"

-- Import the base kong plugin
local BasePlugin = require "kong.plugins.base_plugin"

-- Extend our plugin from the base plugin
local HideTokenHandler = BasePlugin:extend()

-- Setting this very early to avoid logging any service-tokens
HideTokenHandler.PRIORITY = 5

-- creates a new instance of the plugin
function HideTokenHandler:new()
  HideTokenHandler.super.new(self, "hide-token")
end

-- plugin built-in method to handle response header filtering
function HideTokenHandler:header_filter(conf)
  HideTokenHandler.super.header_filter(self)
  -- Add our logic to find the Secret-Token header and remove it
  -- kong.response.clear_header("SECRET-TOKEN")
  hf.filter(conf, kong.response.get_headers())
end

-- return the plugin class
return HideTokenHandler