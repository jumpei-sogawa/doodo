require "application_system_test_case"

class ExhbLogsTest < ApplicationSystemTestCase
  setup do
    @exhb_log = exhb_logs(:one)
  end

  test "visiting the index" do
    visit exhb_logs_url
    assert_selector "h1", text: "Exhb Logs"
  end

  test "creating a Exhb log" do
    visit exhb_logs_url
    click_on "New Exhb Log"

    click_on "Create Exhb log"

    assert_text "Exhb log was successfully created"
    click_on "Back"
  end

  test "updating a Exhb log" do
    visit exhb_logs_url
    click_on "Edit", match: :first

    click_on "Update Exhb log"

    assert_text "Exhb log was successfully updated"
    click_on "Back"
  end

  test "destroying a Exhb log" do
    visit exhb_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exhb log was successfully destroyed"
  end
end
