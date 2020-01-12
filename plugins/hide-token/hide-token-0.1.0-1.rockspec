package = "hide-token"
version = "0.1.0-1"


supported_platforms = {"linux", "macosx"}
source = {
  url = "http://github.com/beatsbears/kong-plugin-blog",
  tag = "0.1.0"
}

description = {
  summary = "hide-token is a plugin for removing potentially sensitive security token headers from responses.",
  homepage = "http://github.com/beatsbears/kong-plugin-blog",
  license = "MIT"
}

dependencies = {
}

local pluginName = "hide-token"
build = {
  type = "builtin",
  modules = {
    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",
    ["kong.plugins."..pluginName..".header_filter"] = "kong/plugins/"..pluginName.."/header_filter.lua",
  }
}