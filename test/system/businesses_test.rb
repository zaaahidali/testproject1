require "application_system_test_case"

class BusinessesTest < ApplicationSystemTestCase
  setup do
    @business = businesses(:one)
  end

  test "visiting the index" do
    visit businesses_url
    assert_selector "h1", text: "Businesses"
  end

  test "creating a Business" do
    visit businesses_url
    click_on "New Business"

    fill_in "B name", with: @business.b_name
    fill_in "Description", with: @business.description
    click_on "Create Business"

    assert_text "Business was successfully created"
    click_on "Back"
  end

  test "updating a Business" do
    visit businesses_url
    click_on "Edit", match: :first

    fill_in "B name", with: @business.b_name
    fill_in "Description", with: @business.description
    click_on "Update Business"

    assert_text "Business was successfully updated"
    click_on "Back"
  end

  test "destroying a Business" do
    visit businesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business was successfully destroyed"
  end
end
