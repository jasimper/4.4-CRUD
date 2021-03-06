require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  def setup
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { title: "title", artist: "artist", genre: "genre", length: 21 }
    end
    assert_redirected_to album_path(assigns(:album))
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album
    assert_response :success
  end

  test "should update album" do
    patch :update, id: @album, album: { title: "title", artist: "artist", genre: "genre", length: 21 }
    assert_redirected_to album_path assigns(:album)
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end
    assert_redirected_to albums_path
  end
end
