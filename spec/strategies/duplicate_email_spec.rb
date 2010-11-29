require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::DuplicateEmailStrategy do

  it "correctly fail gems that have duplicate email addresses" do
    args = strategy_args("duplicate_emails")
    GemLint::Strategies::DuplicateEmailStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with no pkg dir" do
    args = strategy_args("array_emails")
    GemLint::Strategies::DuplicateEmailStrategy.new(args).fail?.should be_false
  end
end
