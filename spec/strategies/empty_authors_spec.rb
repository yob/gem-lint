require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::EmptyAuthorsStrategy do

  it "correctly fail gems that specify have an empty authors array" do
    args = strategy_args("empty_authors")
    GemLint::Strategies::EmptyAuthorsStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that specify multiple authors using an array" do
    args = strategy_args("array_authors")
    GemLint::Strategies::EmptyAuthorsStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems that have a a non-array authors enty" do
    args = strategy_args("csv_authors")
    GemLint::Strategies::EmptyAuthorsStrategy.new(args).fail?.should be_false
  end
end
