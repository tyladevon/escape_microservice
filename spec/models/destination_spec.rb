require 'spec_helper'

RSpec.describe Destination, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :full_address }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :latitude }
end
