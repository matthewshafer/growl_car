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
        expect(GrowlCar.client).to be_kind_of(GrowlCar::Client)
      end

      it "does not create a new GrowlCar::Client when one is already created" do
        client = GrowlCar.client
        expect(GrowlCar.client).to eql(client)
      end

      it "rescues an Atomic::ConcurrentUpdateError and does nothing" do
        atomic_exception = double("Atomic", value: nil).as_null_object
        atomic_exception.stub(:try_update).and_raise(Atomic::ConcurrentUpdateError)
        GrowlCar.instance_variable_set(:"@client", atomic_exception)
        expect { GrowlCar.client }.not_to raise_error(Atomic::ConcurrentUpdateError)
      end
    end
  end

  describe ".configuration" do

    context "when invalid configuration data is provided" do

      it "raises a configuration error" do
        expect {
          GrowlCar.configure do |config|
            config.username = 1234
            config.password = "test_password"
          end
        }.to raise_error(GrowlCar::Error::ConfigurationError)
      end
    end

    context "when valid configuration data is provided" do

      before do
        GrowlCar.configure do |config|
          config.username = "test"
          config.password = "pass"
        end
      end

      it "sets the username" do
        expect(GrowlCar.instance_variable_get(:"@username")).to eql("test")
      end

      it "sets the password" do
        expect(GrowlCar.instance_variable_get(:"@password")).to eql("pass")
      end
    end
  end

  describe ".reset!" do

    context "resets valid valid configuration details" do

      before do
        GrowlCar.configure do |config|
          config.username = "test"
          config.password = "pass"
        end
      end

      it "sets the username to nil" do
        expect { GrowlCar.reset! }.to change { GrowlCar.instance_variable_get(:"@username") }
      end

      it "sets the password to nil" do
        expect { GrowlCar.reset! }.to change { GrowlCar.instance_variable_get(:"@password") }
      end
    end
  end
end