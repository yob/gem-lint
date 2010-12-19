require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::NoFilesStrategy do

  it "correctly fail gems that contain no files" do
    args = strategy_args("no_files")
    GemLint::Strategies::NoFilesStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that contain at least 1 file" do
    args = strategy_args("array_emails")
    GemLint::Strategies::NoFilesStrategy.new(args).fail?.should be_false
  end
end
