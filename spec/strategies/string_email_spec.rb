require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::StringEmailStrategy do

  it "correctly fail gems that store email as a string" do
    args = strategy_args("csv_string_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that specify multiple authors using an array" do
    args = strategy_args("array_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_false
  end
end
