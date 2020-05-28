require 'test_helper'

class CharacterAbilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_abilities_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_abilities_edit_url
    assert_response :success
  end

  test "should get index" do
    get character_abilities_index_url
    assert_response :success
  end

  test "should get show" do
    get character_abilities_show_url
    assert_response :success
  end

end
