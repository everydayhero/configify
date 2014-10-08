require 'configify/version'
require 'configify/base'

module Configify
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def configuration &block
      @configuration_class = Class.new Base, &block if block_given?

      @configuration_class
    end

    def with_config
      return unless configuration

      new_config = configuration.new
      yield new_config if block_given?

      new config: new_config
    end
  end
end
