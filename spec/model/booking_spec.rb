require 'rails_helper'

RSpec.describe Booking, type: :model do 
  let(:booking) {build(:booking)}

  context 'validation' do 
    it 'validate_presence of check_in_date' do 
      subject.check_in_date = nil 
      expect(subject).to_not be_valid
    end 

    it 'validate_presence of check_out_date' do 
      subject.check_out_date = nil 
      expect(subject).to_not be_valid
    end
  end
end