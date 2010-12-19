require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::EmptyEmailStrategy do

  it "correctly fail gems that specify have an empty emails array" do
    args = strategy_args("empty_emails")
    GemLint::Strategies::EmptyEmailStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that specify multiple email using an array" do
    args = strategy_args("array_emails")
    GemLint::Strategies::EmptyEmailStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems that have a a non-array email entry" do
    args = strategy_args("csv_string_emails")
    GemLint::Strategies::EmptyEmailStrategy.new(args).fail?.should be_false
  end
end
