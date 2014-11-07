require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post :create, :wishlist => { }
    end

    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should show wishlist" do
    get :show, :id => wishlists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wishlists(:one).to_param
    assert_response :success
  end

  test "should update wishlist" do
    put :update, :id => wishlists(:one).to_param, :wishlist => { }
    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should destroy wishlist" do
    assert_difference('Wishlist.count', -1) do
      delete :destroy, :id => wishlists(:one).to_param
    end

    assert_redirected_to wishlists_path
  end
end
