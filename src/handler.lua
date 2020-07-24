local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.keycloak-auth-request.access"

local KeycloakAuthRequestHandler = BasePlugin:extend()

KeycloakAuthRequestHandler.PRIORITY = 900

function KeycloakAuthRequestHandler:new()
  KeycloakAuthRequestHandler.super.new(self, "keycloak-auth-request")
end

function KeycloakAuthRequestHandler:access(conf)
  KeycloakAuthRequestHandler.super.access(self)

  access.execute(conf)
end

return KeycloakAuthRequestHandler