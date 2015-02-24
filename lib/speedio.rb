$:.unshift File.expand_path('../lib', __dir__)
require "speedio/version"

module Speedio
  def self.config
    Config.instance
  end

  def self.configure(&block)
    block.call(self.config)
  end

  autoload :Config    , 'speedio/config'
  autoload :Error     , 'speedio/error'
  autoload :Message   , 'speedio/message'
  autoload :Request   , 'speedio/request'
  autoload :Version   , 'speedio/version'
end
