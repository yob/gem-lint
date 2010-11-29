require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::PkgDirStrategy do

  it "correctly fail gems with a pkg dir" do
    args = strategy_args("has_pkg_dir")
    GemLint::Strategies::PkgDirStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with no pkg dir" do
    args = strategy_args("has_no_pkg_dir")
    GemLint::Strategies::PkgDirStrategy.new(args).fail?.should be_false
  end
end
