require('rspec')
  require('pg')
  require('stylist')
  require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("starts empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("prints the name") do
      stylist = Stylist.new({:name => "Johnny", :id => nil})
      expect(stylist.name()).to(eq("Johnny"))
    end
  end

  describe("#id") do
    it("sets its ID when saved") do
      stylist = Stylist.new({:name => "Johnny", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("allows stylists to be saved to the database") do
      stylist = Stylist.new({:name => "Johnny", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("same stylists if the name is the same") do
      stylist1 = Stylist.new({:name => "Johnny", :id => nil})
      stylist2 = Stylist.new({:name => "Johnny", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID") do
      test_stylist = Stylist.new({:name => "Johnny", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "David", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#update") do
    it("allows updating stylists in the database") do
      stylist = Stylist.new({:name => "Johnny", :id => nil})
      stylist.save()
      stylist.update({:name => "John"})
      expect(stylist.name()).to(eq("John"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      test_stylist = Stylist.new({:name => "Johnny", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "David", :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Johnny", :id => nil})
      stylist.save()
      client = Client.new({:name => "Bradley", :stylist_id => stylist.id()})
      client.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
