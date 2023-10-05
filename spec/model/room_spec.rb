require 'rails_helper'

RSpec.describe Room, type: :model do 
  let(:room) { build(:room) }

  context 'validation' do 
    it 'validate_presence_of room_no' do 
      subject.room_no = nil 
      expect(subject).to_not be_valid
    end

    it 'validate_presence_of room_price' do 
      subject.room_price = nil 
      expect(subject).to_not be_valid
    end
  end
end