require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context  "Validation" do 
    it 'validate_presence_of full_name' do 
      subject.full_name = nil 
      expect(subject).to_not be_valid
    end

    it 'validate_presence_of email' do 
      subject.email = nil 
      expect(subject).to_not be_valid
    end 

    it 'validate_presence_of type' do 
      subject.type = nil 
      expect(subject).to_not be_valid
    end

    it 'validate the input, first letter should be capital' do 
      subject.type = "owner"
      expect(subject).to_not be_valid 
    end 

    it 'validate uniqness of email' do 
      subject.email = 'sita@example.com'
      expect(subject).to be_invalid 
    end
  end
  
  context "Association" do 
    it {should have_many(:hotels).class_name('Hotel')} 
    it {should have_many(:rooms).class_name('Room')}
    it {should have_many(:bookings).class_name('Booking')}
  end
end 
