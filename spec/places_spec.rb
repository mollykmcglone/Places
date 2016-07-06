require('rspec')
require('places')

describe(Place) do
  before() do
    Place.clear()
  end

  describe("#location") do
    it("describes where we've been") do
      test_place = Place.new("Bend, Oregon")
      expect(test_place.location()).to(eq("Bend, Oregon"))
    end
  end

  describe(".all") do
    it("is an array that is empty at first") do
      expect(Place.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a place to the array of saved places") do
      test_place = Place.new("Orcas Island, Washington")
      test_place.save()
      expect(Place.all()).to(eq([test_place]))
    end
  end

  describe(".clear") do
    it("empties the place array of all the saved places") do
      Place.new("Charlotte, North Carolina").save()
      Place.clear()
      expect(Place.all()).to(eq([]))
    end
  end
end
