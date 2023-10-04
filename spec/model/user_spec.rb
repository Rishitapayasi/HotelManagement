require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(full_name: "sita",email:"example@gmail.com",type: "Owner")}

  before { subject.save }

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
  end
end 