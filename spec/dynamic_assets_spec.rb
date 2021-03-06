require 'spec_helper'
describe Netzke::Core::DynamicAssets do
  # js comment stripping is disabled atm
  xit "should strip js comments" do
    Netzke::Core::DynamicAssets.strip_js_comments("var test;//commment").should == "var test;"
  end

  xit "should not strip // in strings" do
    Netzke::Core::DynamicAssets.strip_js_comments('var someVar = "abc//def";').should == 'var someVar="abc//def";'
  end
end
