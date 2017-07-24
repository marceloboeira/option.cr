require "./spec_helper"

describe "option" do
  describe "when given with nil" do
    it "returns an instance of None" do
      option(nil).class.should eq(None(Nil))
    end
  end

  describe "when given with a value" do
    it "returns an instance of Some(Type)" do
      option("foo").class.should eq(Some(String))
    end
  end

  describe "when given with a value" do
    it "returns an instance of Some(Type)" do
      option([1, nil].sample.or_else(1) + 1).to eq(2)
    end
  end
end

describe "none" do
  it "returns an instance of None" do
    none.class.should eq(None(Nil))
  end

  describe "get" do
    it "raises an error" do
      expect_raises Exception, "None.get" do
        none.get
      end
    end
  end

  describe "or_else" do
    it "returns the default" do
      none.or_else("default").should eq("default")
    end
  end

  describe "empty?" do
    it "returns true" do
      none.empty?.should eq(true)
    end
  end
end

describe "some" do
  it "returns an instance of Some(Type)" do
    some("foo").class.should eq(Some(String))
  end

  describe "get" do
    it "returns the value" do
      some("foo").get.should eq("foo")
    end
  end

  describe "or_else" do
    it "returns the value" do
      some("foo").or_else("default").should eq("foo")
    end
  end

  describe "empty?" do
    it "returns false" do
      some("foo").empty?.should eq(false)
    end
  end
end
