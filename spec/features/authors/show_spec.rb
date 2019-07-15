require 'rails_helper'

RSpec.describe "Author Show page" do
  describe "as a user" do
    describe "when I visit a specific author's page" do
      it "shows information about the specific author" do
        @c_bohjalian = Author.create!(name: "Chris Bohjalian")
        @flight_attendant = @c_bohjalian.books.create!(title: "The Flight Attendant", page_count: 345, year_published: 2018)
        @sleep_walker = @c_bohjalian.books.create!(title: "The Sleepwalker", page_count: 234, year_published: 2017)
        @guest_room = @c_bohjalian.books.create!(title: "The Guest Room", page_count: 203, year_published: 2016)

        visit books_path

        click_link @c_bohjalian.name, match: :first
        expect(current_path).to eq(author_path(@c_bohjalian))

        expect(page).to have_content(@c_bohjalian.name)
        expect(page).to have_content(@flight_attendant.title)
        expect(page).to have_content(@sleep_walker.title)
        expect(page).to have_content(@guest_room.title)
        expect(page).to have_content(@c_bohjalian.average_pages_written.to_i)
      end
    end
  end
end
