require "application_system_test_case"

class NonSensesTest < ApplicationSystemTestCase
  setup do
    @non_sense = non_senses(:one)
  end

  test "visiting the index" do
    visit non_senses_url
    assert_selector "h1", text: "Non Senses"
  end

  test "creating a Non sense" do
    visit non_senses_url
    click_on "New Non Sense"

    fill_in "Amount", with: @non_sense.amount
    fill_in "Name", with: @non_sense.name
    click_on "Create Non sense"

    assert_text "Non sense was successfully created"
    click_on "Back"
  end

  test "updating a Non sense" do
    visit non_senses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @non_sense.amount
    fill_in "Name", with: @non_sense.name
    click_on "Update Non sense"

    assert_text "Non sense was successfully updated"
    click_on "Back"
  end

  test "destroying a Non sense" do
    visit non_senses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Non sense was successfully destroyed"
  end
end
