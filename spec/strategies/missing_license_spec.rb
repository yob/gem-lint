require File.dirname(__FILE__) + "/../spec_helper"

require "gem_lint"

describe GemLint::Strategies::MissingLicenseStrategy do

  it "correctly fail gems that have a license file but empty license field" do
    args = strategy_args("has_license_file")
    GemLint::Strategies::MissingLicenseStrategy.new(args).fail?.should be_true
  end

  it "correctly pass gems that have no license file and an empty license field" do
    args = strategy_args("has_readme")
    GemLint::Strategies::MissingLicenseStrategy.new(args).fail?.should be_false
  end

  it "correctly pass gems that have content in their license field" do
    args = strategy_args("mit_licensed")
    GemLint::Strategies::MissingLicenseStrategy.new(args).fail?.should be_false
  end
end
