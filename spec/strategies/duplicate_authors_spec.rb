require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::DuplicateAuthorsStrategy do

  it "correctly fail gems that have duplicate author names" do
    args = strategy_args("duplicate_authors")
    GemLint::Strategies::DuplicateAuthorsStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with no pkg dir" do
    args = strategy_args("array_authors")
    GemLint::Strategies::DuplicateAuthorsStrategy.new(args).fail?.should be_false
  end
end
