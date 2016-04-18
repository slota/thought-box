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
    page.has_field?('Url', :with => 'url_one')
    page.has_field?('Title', :with => 'title')

    fill_in("Url", :with => "https://github.com/")
    fill_in("Title", :with => "john")

    click_on("Save changes")

    assert current_path, "/links"
    assert page.has_content?("john")
    assert page.has_content?("https://github.com/")
  end

  test "user can not edit links with bad url" do
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
      page.has_field?('Url', :with => 'url_one')
      page.has_field?('Title', :with => 'title')

      fill_in("Url", :with => "//github.com/")
      fill_in("Title", :with => "john")

      click_on("Save changes")
      save_and_open_page

      assert current_path, "/links/1/edit"
      assert page.has_content?("Save unsuccessful.")

    end
end
