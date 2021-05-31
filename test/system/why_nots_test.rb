require "application_system_test_case"

class WhyNotsTest < ApplicationSystemTestCase
  setup do
    @why_not = why_nots(:one)
  end

  test "visiting the index" do
    visit why_nots_url
    assert_selector "h1", text: "Why Nots"
  end

  test "creating a Why not" do
    visit why_nots_url
    click_on "New Why Not"

    fill_in "Amount", with: @why_not.amount
    fill_in "Name", with: @why_not.name
    click_on "Create Why not"

    assert_text "Why not was successfully created"
    click_on "Back"
  end

  test "updating a Why not" do
    visit why_nots_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @why_not.amount
    fill_in "Name", with: @why_not.name
    click_on "Update Why not"

    assert_text "Why not was successfully updated"
    click_on "Back"
  end

  test "destroying a Why not" do
    visit why_nots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Why not was successfully destroyed"
  end
end
