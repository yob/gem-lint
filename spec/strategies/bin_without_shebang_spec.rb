require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::BinWithoutShebangStrategy do

  it "correctly fail gems that have executables without a shebang" do
    args = strategy_args("bin_missing_shebang")
    GemLint::Strategies::BinWithoutShebangStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that have executables with a shebang" do
    args = strategy_args("bin_has_shebang")
    GemLint::Strategies::BinWithoutShebangStrategy.new(args).fail?.should be_false
  end
end
