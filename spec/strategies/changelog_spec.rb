require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::ChangelogStrategy do

  it "correctly fail gems with no changelog-ish file" do
    args = strategy_args("no_changelog")
    GemLint::Strategies::ChangelogStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems with a changelog file" do
    args = strategy_args("has_changelog")
    GemLint::Strategies::ChangelogStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems with a history file" do
    args = strategy_args("has_history")
    GemLint::Strategies::ChangelogStrategy.new(args).fail?.should be_false
  end
end
