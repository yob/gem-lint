require File.dirname(__FILE__) + "/spec_helper"

require "gem_lint"

GemLint.strategies.each do |klass|
  describe "The #{klass} strategy" do
    before(:each) do
      @args = strategy_args("has_pkg_dir")
      @obj  = klass.new(@args)
    end

    it "should respond to the description method" do
      @obj.respond_to?(:description).should be_true
    end

    it "should respond to the description method" do
      @obj.respond_to?(:tag).should         be_true
    end

    it "should respond to the description method" do
      @obj.respond_to?(:fail?).should       be_true
    end

    it "should not raise an exception in the description method" do
      lambda {
        @obj.description
      }.should_not raise_error
    end

    it "should not raise an exception in the tag method" do
      lambda {
        @obj.tag
      }.should_not raise_error
    end

    it "should not raise an exception in the fail? method" do
      lambda {
        @obj.fail?
      }.should_not raise_error
    end

    it "should return a string from the decription method" do
      @obj.description.should be_a_kind_of(String)
    end

    it "should return a symbol from the tag method" do
      @obj.tag.should         be_a_kind_of(Symbol)
    end
  end

end
