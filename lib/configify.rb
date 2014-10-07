require 'configify/version'
require 'configify/base'

module Configify
  def config
    @config ||= self.class.configuration.new if self.class.configuration
  end

  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def configuration &block
      @configuration_class = Class.new Base, &block if block_given?

      @configuration_class
    end
  end
end
