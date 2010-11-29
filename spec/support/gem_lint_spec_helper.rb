# coding: utf-8

# some helper methods available to all specs
module GemLintSpecHelper

  # returns a hash suitable for passing to the constructor for each strategy
  # class.
  def strategy_args(gem_name)
    base_path = File.expand_path(File.dirname(__FILE__) + "/../gems")
    {
      :filename      => "lint-1.0.gem",
      :data_path     => File.join(base_path, gem_name, "data"),
      :metadata_path => File.join(base_path, gem_name, "metadata")
    }
  end
end
