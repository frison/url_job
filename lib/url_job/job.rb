module UrlJob
  require 'uniquify'

  class Job < ActiveRecord::Base
    set_table_name :url_jobs

    uniquify :token do
      SecureRandom.hex(40)
    end



    validates :handler, :presence => true

    class << self
      def from_object(object, &block)
        unless object.respond_to?(:perform)
          raise ArgumentError, 'Cannot create a UrlJob from an object that does not respond to perform'
        end

        create(:payload_object => object)
      end
    end

    def limit_reached?
      return false if no_limit?
      action_count >= action_limit
    end

    def no_limit?
      0 == action_limit
    end

    ParseObjectFromYaml = /\!ruby\/\w+\:([^\s]+)/
    def name
      @name ||= payload_object.respond_to?(:display_name) ?
          payload_object.display_name :
          payload_object.class.name
    rescue DeserializationError
      ParseObjectFromYaml.match(handler)[1]
    end

    def payload_object=(object)
      @payload_object = object
      self.handler = object.to_yaml
    end

    def payload_object
      @payload_object ||= YAML.load(self.handler)
    rescue TypeError, LoadError, NameError, ArgumentError => e
      raise DeserializationError,
            "UrlJob failed to load: #{e.message}. Handler: #{handler.inspect}"
    end

  end
end