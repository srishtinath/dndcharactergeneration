require 'test_helper'

class CharacterSpellsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_spells_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_spells_edit_url
    assert_response :success
  end

  test "should get index" do
    get character_spells_index_url
    assert_response :success
  end

  test "should get show" do
    get character_spells_show_url
    assert_response :success
  end

end
