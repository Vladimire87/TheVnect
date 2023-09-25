require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(first_name: 'John', last_name: 'Doe')

  describe '#full_name_upcase' do
    it 'returns the full name in upcase' do
      expect(user.full_name_upcase).to eq('JOHN DOE')
    end
  end
  describe '#full_name_downcase' do
    it 'returns the full name in downcase' do
      expect(user.full_name_downcase).to eq('john doe')
    end
  end
  describe '#full_name_titleize' do
    it 'returns the full name in titleize' do
      expect(user.full_name_titleize).to eq('John Doe')
    end
  end
  describe '#name_initials' do
    it 'returns the name initials' do
      expect(user.name_initials).to eq('JD')
    end
  end
end
