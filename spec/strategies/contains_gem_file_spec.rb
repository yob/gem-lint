require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::ContainsGemFileStrategy do

  it "correctly fail gems that contain another gem file" do
    args = strategy_args("has_embedded_gem")
    GemLint::Strategies::ContainsGemFileStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that don't contain another gem file" do
    args = strategy_args("no_embedded_gem")
    GemLint::Strategies::ContainsGemFileStrategy.new(args).fail?.should be_false
  end
end
