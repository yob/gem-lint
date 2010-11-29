require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::ReadmeStrategy do

  it "correctly fail gems without a readme" do
    args = strategy_args("no_readme")
    GemLint::Strategies::ReadmeStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with a readme" do
    args = strategy_args("has_readme")
    GemLint::Strategies::ReadmeStrategy.new(args).fail?.should be_false
  end
end
