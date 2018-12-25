require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get serch_form" do
    get books_serch_form_url
    assert_response :success
  end

end
