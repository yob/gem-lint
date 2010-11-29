require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::BinEndsWithRbStrategy do

  it "correctly fail gems with an executable ending in .rb" do
    args = strategy_args("bin_has_rb")
    GemLint::Strategies::BinEndsWithRbStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with no executable ending in .rb" do
    args = strategy_args("bin_has_no_rb")
    GemLint::Strategies::BinEndsWithRbStrategy.new(args).fail?.should be_false
  end
end
