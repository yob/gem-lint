require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::TestFilesInFilesAttributeStrategy do

  it "correctly fail gems with test files listed in spec.files but not spec.test_files" do
    args = strategy_args("test_files_fail")
    GemLint::Strategies::TestFilesInFilesAttributeStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with tests listed in spec.files and spec.test_files" do
    args = strategy_args("test_files_ok")
    GemLint::Strategies::TestFilesInFilesAttributeStrategy.new(args).fail?.should be_false
  end

  it "correctly fail gems with spec files listed in spec.files but not spec.test_files" do
    args = strategy_args("spec_files_fail")
    GemLint::Strategies::TestFilesInFilesAttributeStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with specs listed in spec.files and spec.test_files" do
    args = strategy_args("spec_files_ok")
    GemLint::Strategies::TestFilesInFilesAttributeStrategy.new(args).fail?.should be_false
  end
end
