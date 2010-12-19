require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::CsvAuthorsStrategy do

  it "correctly fail gems that specify multiple authors using a comma" do
    args = strategy_args("csv_authors")
    GemLint::Strategies::CsvAuthorsStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that specify multiple authors using an array" do
    args = strategy_args("array_authors")
    GemLint::Strategies::CsvAuthorsStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems that have an empty authors arrayy" do
    args = strategy_args("empty_authors")
    GemLint::Strategies::CsvAuthorsStrategy.new(args).fail?.should be_false
  end
end
