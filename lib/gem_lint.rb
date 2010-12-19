# coding: utf-8

# stdlib
require 'tmpdir'
require 'fileutils'
require 'rubygems/format'

# our own code
require 'gem_lint/runner'

# dynamically load all available strategies
strategies_path = File.dirname(__FILE__) + "/gem_lint/strategies/**/*.rb"
Dir[strategies_path].sort.each {|f| require f }

module GemLint

  # return an array of all strategy classes
  #
  def self.strategies
    GemLint::Strategies.constants.sort.select { |class_name|
      class_name.to_s != "AbstractStrategy"
    }.map { |class_name|
      GemLint::Strategies.const_get(class_name)
    }
  end
end
