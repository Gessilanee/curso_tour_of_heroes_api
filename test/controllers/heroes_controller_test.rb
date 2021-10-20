require "test_helper"

class HeroesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heros = heroes(:one)
  end

  test "should get index" do
    get heroes_url, as: :json
    assert_response :success
  end

  test "should create heros" do
    assert_difference('Heros.count') do
      post heroes_url, params: { heros: { name: @heros.name } }, as: :json
    end

    assert_response 201
  end

  test "should show heros" do
    get heros_url(@heros), as: :json
    assert_response :success
  end

  test "should update heros" do
    patch heros_url(@heros), params: { heros: { name: @heros.name } }, as: :json
    assert_response 200
  end

  test "should destroy heros" do
    assert_difference('Heros.count', -1) do
      delete heros_url(@heros), as: :json
    end

    assert_response 204
  end
end
