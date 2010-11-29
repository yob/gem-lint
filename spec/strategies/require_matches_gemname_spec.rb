require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::RequireMatchesGemnameStrategy do

  it "correctly fail gems with a basic gemname and no matching require" do
    args = strategy_args("require_basic_fail")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with a basic gemname and matching require" do
    args = strategy_args("require_basic_ok")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_false
  end

  it "correctly fail gems with an underscored gemname and no matching require" do
    args = strategy_args("require_underscored_fail")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with an underscored gemname and matching require" do
    args = strategy_args("require_underscored_ok")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_false
  end

  it "correctly fail gems with an hyphenated gemname and no matching require" do
    args = strategy_args("require_hyphenated_fail")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with an hyphenated gemname and matching require" do
    args = strategy_args("require_hyphenated_ok")
    GemLint::Strategies::RequireMatchesGemnameStrategy.new(args).fail?.should be_false
  end
end
