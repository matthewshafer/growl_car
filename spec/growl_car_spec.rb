require 'spec_helper'

describe GrowlCar do
  
  context "when delegating to a client" do

    before do
      GrowlCar::Client.any_instance.stub(:test).and_return("testing")
    end

    it "delegates to GrowlCar::Client" do
      expect(GrowlCar.test).to eql("testing")
    end

    describe ".respond_to?" do

      it "delegates to GrowlCar::Client" do
        expect(GrowlCar.respond_to?(:test)).to be_true
      end
    end

    describe ".client" do
      it "returns a GrowlCar::Client" do
        expect(GrowlCar.client).to be_kind_of GrowlCar::Client
      end
    end
  end
end