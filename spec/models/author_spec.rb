require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:books).through(:book_authors)}
  end
end
