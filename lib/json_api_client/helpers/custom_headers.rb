module JsonApiClient
  module Helpers
    module CustomHeaders
      extend ActiveSupport::Concern

      module ClassMethods
        def with_headers(headers)
          self.custom_headers = headers
          yield
        ensure
          self.custom_headers = {}
        end

        def custom_headers
          self.header_store
        end

        def custom_headers=(headers)
          self.header_store.replace(headers)
        end

        def header_store
          Thread.current["json_api_client-#{resource_name}"] ||= {}
        end
      end

    end
  end
end