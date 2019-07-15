require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:books).through(:book_authors)}
  end

  describe '.average_pages_written' do
    it "computes average of all pages written" do
      @c_bohjalian = Author.create!(name: "Chris Bohjalian")
      @flight_attendant = @c_bohjalian.books.create!(title: "The Flight Attendant", page_count: 150, year_published: 2018)
      @sleep_walker = @c_bohjalian.books.create!(title: "The Sleepwalker", page_count: 250, year_published: 2017)
      @guest_room = @c_bohjalian.books.create!(title: "The Guest Room", page_count: 125, year_published: 2016)

      expect(@c_bohjalian.average_pages_written).to eq(175)
    end
  end
end
