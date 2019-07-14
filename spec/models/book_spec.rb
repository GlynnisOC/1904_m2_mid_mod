require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :page_count }
    it { should validate_presence_of :year_published }
  end

  describe 'relationships' do
    it { should have_many :authors }
    it { should have_many(:authors).through(:book_authors)}
  end
end
