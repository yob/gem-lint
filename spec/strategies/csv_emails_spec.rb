require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::CsvEmailStrategy do

  it "correctly fail gems that specify multiple authors using a comma" do
    args = strategy_args("csv_array_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_true
  end

  it "correctly fail gems that specify multiple authors using a comma" do
    args = strategy_args("csv_string_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that specify multiple authors using an array" do
    args = strategy_args("array_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems that have an empty email array" do
    args = strategy_args("empty_emails")
    GemLint::Strategies::CsvEmailStrategy.new(args).fail?.should be_false
  end
end
