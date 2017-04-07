require('rspec')
  require('pg')
  require('stylist')
  require("spec_helper")

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Joe", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("lets you read the name out") do
      test_client = Client.new({:name => "Joe", :stylist_id => 1})
      expect(test_client.name()).to(eq("Joe"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:name => "Joe", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("clients are the same if the name and stylist ID are the same") do
      test_client1 = Client.new({:name => "Joe", :stylist_id => 1})
      test_client2 = Client.new({:name => "Joe", :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end
end
