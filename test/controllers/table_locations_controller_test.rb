require 'test_helper'

class TableLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table_location = table_locations(:one)
  end

  test "should get index" do
    get table_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_table_location_url
    assert_response :success
  end

  test "should create table_location" do
    assert_difference('TableLocation.count') do
      post table_locations_url, params: { table_location: { ends_at: @table_location.ends_at, latitude: @table_location.latitude, longitude: @table_location.longitude, name: @table_location.name, starts_at: @table_location.starts_at, status: @table_location.status } }
    end

    assert_redirected_to table_location_url(TableLocation.last)
  end

  test "should show table_location" do
    get table_location_url(@table_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_location_url(@table_location)
    assert_response :success
  end

  test "should update table_location" do
    patch table_location_url(@table_location), params: { table_location: { ends_at: @table_location.ends_at, latitude: @table_location.latitude, longitude: @table_location.longitude, name: @table_location.name, starts_at: @table_location.starts_at, status: @table_location.status } }
    assert_redirected_to table_location_url(@table_location)
  end

  test "should destroy table_location" do
    assert_difference('TableLocation.count', -1) do
      delete table_location_url(@table_location)
    end

    assert_redirected_to table_locations_url
  end
end
