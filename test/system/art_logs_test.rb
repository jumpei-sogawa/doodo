require "application_system_test_case"

class ArtLogsTest < ApplicationSystemTestCase
  setup do
    @art_log = art_logs(:one)
  end

  test "visiting the index" do
    visit art_logs_url
    assert_selector "h1", text: "Art Logs"
  end

  test "creating a Art log" do
    visit art_logs_url
    click_on "New Art Log"

    click_on "Create Art log"

    assert_text "Art log was successfully created"
    click_on "Back"
  end

  test "updating a Art log" do
    visit art_logs_url
    click_on "Edit", match: :first

    click_on "Update Art log"

    assert_text "Art log was successfully updated"
    click_on "Back"
  end

  test "destroying a Art log" do
    visit art_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Art log was successfully destroyed"
  end
end
