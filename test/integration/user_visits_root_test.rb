require 'test_helper'

class UserVisitsRootTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "unauthenticated user visits root" do
    visit('/')
    assert page.has_content?("Log In or Sign Up")
  end
end
