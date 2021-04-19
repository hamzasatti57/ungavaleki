require "application_system_test_case"

class PlugsTest < ApplicationSystemTestCase
  setup do
    @plug = plugs(:one)
  end

  test "visiting the index" do
    visit plugs_url
    assert_selector "h1", text: "Plugs"
  end

  test "creating a Plug" do
    visit plugs_url
    click_on "New Plug"

    fill_in "Amount", with: @plug.amount
    fill_in "Name", with: @plug.name
    click_on "Create Plug"

    assert_text "Plug was successfully created"
    click_on "Back"
  end

  test "updating a Plug" do
    visit plugs_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @plug.amount
    fill_in "Name", with: @plug.name
    click_on "Update Plug"

    assert_text "Plug was successfully updated"
    click_on "Back"
  end

  test "destroying a Plug" do
    visit plugs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plug was successfully destroyed"
  end
end
