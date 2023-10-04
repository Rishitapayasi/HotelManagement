require 'rails_helper'

RSpec.describe Hotel, type: :model do 
  subject {Hotel.new(name: "hotel", location: "indore",status: "open")}

  before { subject.save }

  context  "Validation" do 
    it 'validate_presence_of name' do 
      subject.name = nil 
      expect(subject).to_not be_valid
    end

    it 'validate_presence_of location' do 
      subject.location = nil 
      expect(subject).to_not be_valid
    end 
  end
end