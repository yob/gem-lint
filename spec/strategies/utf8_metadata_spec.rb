require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::Utf8MetadataStrategy do

  it "correctly fail gems with metadata with win-1252 characters" do
    args = strategy_args("win1252_metadata")
    GemLint::Strategies::Utf8MetadataStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with no pkg dir" do
    args = strategy_args("utf8_metadata")
    GemLint::Strategies::Utf8MetadataStrategy.new(args).fail?.should be_false
  end
end
