require 'spec_helper'

RSpec.describe Destination, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :full_address }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :latitude }
  end

  describe "Class Methods" do
    it "self.add_destination(response)" do
      response = {"candidates"=>[{"formatted_address"=>"Denver, CO, USA", "geometry"=>{"location"=>{"lat"=>39.7392358, "lng"=>-104.990251}}, "name"=>"Denver"}], "status"=>"OK"}
      destination_count = Destination.all.count
      Destination.add_destination(response)

      expect(Destination.all.count).to eq(destination_count + 1)
      destination = Destination.last

      expect(destination.name).to eq("Denver")
      expect(destination.full_address).to eq("Denver, CO, USA")
      expect(destination.longitude).to eq(-104.990251)
      expect(destination.latitude).to eq(39.7392358)
    end
  end
end
