require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::CapitalsInNameStrategy do

  it "correctly fail gems with a capital letter in their name" do
    args = strategy_args("capital_in_name")
    GemLint::Strategies::CapitalsInNameStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with only lower case letters in their name" do
    args = strategy_args("lower_case_name")
    GemLint::Strategies::CapitalsInNameStrategy.new(args).fail?.should be_false
  end
end
