require 'test_helper'
require 'pry'

class UserVisitsLinkPageTest < ActiveSupport::TestCase
  test "user visits link page, uses incorrect url" do
    visit("/")
    click_link("Sign Up")

    fill_in('Email', :with => "John.Slota@gmail.com")
    fill_in('Password', :with => "123")
    fill_in('Password confirmation', :with => "123")

    click_on("Save User")

    assert_current_path("/links")
    assert page.has_content?("Welcome John.Slota@gmail.com")
    assert page.has_content?("Url")
    assert page.has_content?("Title")

    fill_in('Url', :with => "base")
    fill_in('Title', :with => "title")

    click_on("Save Link")

    assert page.has_content?("URL is not valid.")
  end

  test "user visits link page, correct url" do
    visit("/")
    click_link("Sign Up")

    fill_in('Email', :with => "John.Slota@gmail.com")
    fill_in('Password', :with => "123")
    fill_in('Password confirmation', :with => "123")

    click_on("Save User")

    assert_current_path("/links")
    assert page.has_content?("Welcome John.Slota@gmail.com")
    assert page.has_content?("Url")
    assert page.has_content?("Title")

    fill_in('Url', :with => "http://today.turing.io/outlines/2016-04-18/")
    fill_in('Title', :with => "title")

    click_on("Save Link")

    save_and_open_page
    assert page.has_content?("Successfully saved link.")
    assert page.has_content?("title")
    assert page.has_content?("http://today.turing.io/outlines/2016-04-18/")
  end
end
