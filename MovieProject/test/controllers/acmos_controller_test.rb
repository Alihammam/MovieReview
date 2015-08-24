require 'test_helper'

class AcmosControllerTest < ActionController::TestCase
  setup do
    @acmo = acmos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acmos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acmo" do
    assert_difference('Acmo.count') do
      post :create, acmo: { actor_id: @acmo.actor_id, movie_id: @acmo.movie_id }
    end

    assert_redirected_to acmo_path(assigns(:acmo))
  end

  test "should show acmo" do
    get :show, id: @acmo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acmo
    assert_response :success
  end

  test "should update acmo" do
    patch :update, id: @acmo, acmo: { actor_id: @acmo.actor_id, movie_id: @acmo.movie_id }
    assert_redirected_to acmo_path(assigns(:acmo))
  end

  test "should destroy acmo" do
    assert_difference('Acmo.count', -1) do
      delete :destroy, id: @acmo
    end

    assert_redirected_to acmos_path
  end
end
