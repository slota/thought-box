require 'test_helper'
require 'pry'

class UserVisitsLinkPageTest < ActiveSupport::TestCase
test "user can edit links" do
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

    within("#url_one") do
      assert page.has_content?("edit")
      click_on("edit")
    end

    assert current_path, "/links/1/edit"
  end
end