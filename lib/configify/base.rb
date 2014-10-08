module Configify
  class Base
    def initialize
      self.class.properties.each do |key, value|
        send "#{key}=", value
      end
    end

    def load_from_env prefix: self.class.env_variable_prefix
      self.class.properties.each do |key, _|
        env_var_name = "#{prefix}_#{key.upcase}"
        self.send "#{key}=", ENV[env_var_name] if ENV.has_key? env_var_name
      end

      self
    end

    class << self
      def env_variable_prefix prefix = nil
        @env_variable_prefix = prefix if prefix

        @env_variable_prefix
      end

      def property key, default: nil
        attr_accessor key.to_sym

        properties[key.to_sym] = default
      end

      def properties
        @properties ||= Hash.new
      end
    end
  end
end
