require 'rails_helper'

RSpec.describe Hotel, type: :model do 
  let(:hotel) { build(:hotel) }

  context  "Validation" do 
    it 'validate_presence_of name' do 
      subject.name = nil 
      expect(subject).to_not be_valid
    end

    it 'validate_presence_of location' do 
      subject.location = nil 
      expect(subject).to_not be_valid
    end 

    context "Association" do 
      it {should belong_to(:user).class_name('User')}
      it {should have_many(:rooms).class_name('Room')}
      it {should have_many(:bookings).class_name('Booking')}
    end

  end
end 