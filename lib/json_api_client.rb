require 'faraday'
require 'json'

module JsonApiClient
  autoload :Associations, 'json_api_client/associations'
  autoload :Attributes, 'json_api_client/attributes'
  autoload :Connection, 'json_api_client/connection'
  autoload :Errors, 'json_api_client/errors'
  autoload :Helpers, 'json_api_client/helpers'
  autoload :LinkDefinition, 'json_api_client/link_definition'
  autoload :LinkedData, 'json_api_client/linked_data'
  autoload :Middleware, 'json_api_client/middleware'
  autoload :Parsers, 'json_api_client/parsers'
  autoload :Query, 'json_api_client/query'
  autoload :Resource, 'json_api_client/resource'
  autoload :ResultSet, 'json_api_client/result_set'
  autoload :Schema, 'json_api_client/schema'
  autoload :Scope, 'json_api_client/scope'
  autoload :Utils, 'json_api_client/utils'
end