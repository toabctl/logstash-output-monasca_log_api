require_relative '../spec_helper'

describe KeystoneClient do

  before :each do
    @keystone_client = KeystoneClient.new('host', 0, double("User"))
  end

  describe "#new" do
    it "takes two parameters and returns a KeystoneClient object" do
      @keystone_client.should be_an_instance_of KeystoneClient
    end
  end

  describe "#get_token" do
    it "authenticates against keystone and returns the token" do
      @keystone_client.stub(:authenticate).and_return("{\"access\": {\"token\": {\"id\": \"7f5971345261484fb079dc4c690e167b\"}}}")
      @keystone_client.get_token.should == '7f5971345261484fb079dc4c690e167b'
    end
  end

end