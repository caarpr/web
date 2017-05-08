require 'test_helper'

class TableEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table_event = table_events(:one)
  end

  test "should get index" do
    get table_events_url
    assert_response :success
  end

  test "should get new" do
    get new_table_event_url
    assert_response :success
  end

  test "should create table_event" do
    assert_difference('TableEvent.count') do
      post table_events_url, params: { table_event: { ends_at: @table_event.ends_at, postcards_collected: @table_event.postcards_collected, starts_at: @table_event.starts_at, status: @table_event.status, volunteers_collected: @table_event.volunteers_collected } }
    end

    assert_redirected_to table_event_url(TableEvent.last)
  end

  test "should show table_event" do
    get table_event_url(@table_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_event_url(@table_event)
    assert_response :success
  end

  test "should update table_event" do
    patch table_event_url(@table_event), params: { table_event: { ends_at: @table_event.ends_at, postcards_collected: @table_event.postcards_collected, starts_at: @table_event.starts_at, status: @table_event.status, volunteers_collected: @table_event.volunteers_collected } }
    assert_redirected_to table_event_url(@table_event)
  end

  test "should destroy table_event" do
    assert_difference('TableEvent.count', -1) do
      delete table_event_url(@table_event)
    end

    assert_redirected_to table_events_url
  end
end
