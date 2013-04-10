require 'spec_helper'

describe GrowlCar::Client do

  context ".new" do

    let(:client) { GrowlCar::Client.new }

    describe "#send_growl_notification" do

      it "returns true when the request status is 200" do
        stub_post("/notifications").to_return(status: 200)
        expect(client.send_growl_notification("test", "test")).to be_true
      end

      it "raises a GrowlCar::Error::UnauthorizedError when a username or password is incorrect" do
        stub_post("/notifications").to_return(status: [401, "Unauthorized"])
        expect { client.send_growl_notification("test", "test") }.to raise_error(GrowlCar::Error::UnauthorizedError)
      end

      it "raises a GrowlCar::Error::HttpError when a status other than 200 or 401 is encountered" do
        stub_post("/notifications").to_return(status: [404, "Not Found"])
        expect { client.send_growl_notification("test", "test") }.to raise_error(GrowlCar::Error::HttpError)
      end
    end
  end
end