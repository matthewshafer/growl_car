require 'spec_helper'

describe GrowlCar::Configuration do
  
  context ".keys" do

    it "returns an array of keys" do
      expect(GrowlCar::Configuration.keys).to eql([:username, :passsword])
    end
  end

  context ".boxcar_url" do

    it "returns the boxcar url to post growl notifications to" do
      expect(GrowlCar::Configuration.boxcar_url).to eql("https://boxcar.io/notifications")
    end
  end
end