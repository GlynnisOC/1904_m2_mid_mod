require 'rails_helper'

RSpec.describe "Book Index page" do
  describe "As a visitor" do
    it "I see all of the books in the system's information" do
      @flight_attendant = Book.create!(title: "The Flight Attendant", page_count: 345, year_published: 2018)
      @wife_between_us = Book.create!(title: "The Wife Between Us", page_count: 233, year_published: 2017)
      @woman_in_cabin_ten = Book.create!(title: "The Woman in Cabin Ten", page_count: 276, year_published: 2015)
      @c_bohjalian = Author.create!(name: "Chris Bohjalian")
      @r_ware = Author.create!(name: "Ruth Ware")
      @s_pekkanen = Author.create!(name: "Sarah Pekkanen")
      @g_hendricks = Author.create!(name: "Greer Hendricks")
      @flight_attendant.authors << @c_bohjalian
      @woman_in_cabin_ten.authors << @r_ware
      @wife_between_us.authors << @s_pekkanen
      @wife_between_us.authors << @g_hendricks

      visit books_path

      expect(page).to have_content(@flight_attendant.title)
      expect(page).to have_content(@wife_between_us.title)
      expect(page).to have_content(@woman_in_cabin_ten.title)

      expect(page).to have_content(@flight_attendant.page_count)
      expect(page).to have_content(@wife_between_us.page_count)
      expect(page).to have_content(@woman_in_cabin_ten.page_count)

      expect(page).to have_content(@flight_attendant.year_published)
      expect(page).to have_content(@wife_between_us.year_published)
      expect(page).to have_content(@woman_in_cabin_ten.year_published)

      expect(page).to have_content(@flight_attendant.authors.name)
      expect(page).to have_content(@wife_between_us.authors.name)
      expect(page).to have_content(@woman_in_cabin_ten.authors.name)
    end
  end
end
