require "application_system_test_case"

class TimeStampsTest < ApplicationSystemTestCase
  setup do
    @time_stamp = time_stamps(:one)
  end

  test "visiting the index" do
    visit time_stamps_url
    assert_selector "h1", text: "Time Stamps"
  end

  test "creating a Time stamp" do
    visit time_stamps_url
    click_on "New Time Stamp"

    fill_in "Amount", with: @time_stamp.amount
    fill_in "Name", with: @time_stamp.name
    click_on "Create Time stamp"

    assert_text "Time stamp was successfully created"
    click_on "Back"
  end

  test "updating a Time stamp" do
    visit time_stamps_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @time_stamp.amount
    fill_in "Name", with: @time_stamp.name
    click_on "Update Time stamp"

    assert_text "Time stamp was successfully updated"
    click_on "Back"
  end

  test "destroying a Time stamp" do
    visit time_stamps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time stamp was successfully destroyed"
  end
end
