require "application_system_test_case"

class StrainsTest < ApplicationSystemTestCase
  setup do
    @strain = strains(:one)
  end

  test "visiting the index" do
    visit strains_url
    assert_selector "h1", text: "Strains"
  end

  test "should create strain" do
    visit strains_url
    click_on "New strain"

    fill_in "Average rating", with: @strain.average_rating
    fill_in "Category", with: @strain.category
    fill_in "Distance", with: @strain.distance
    fill_in "Flower svg", with: @strain.flower_svg
    fill_in "Name", with: @strain.name
    fill_in "Nug image", with: @strain.nug_image
    fill_in "Phenotype", with: @strain.phenotype
    fill_in "Review count", with: @strain.review_count
    fill_in "Short description", with: @strain.short_description
    fill_in "Slug", with: @strain.slug
    fill_in "Subtitle", with: @strain.subtitle
    fill_in "Thc", with: @strain.thc
    fill_in "Top effect", with: @strain.top_effect
    fill_in "Top terp", with: @strain.top_terp
    click_on "Create Strain"

    assert_text "Strain was successfully created"
    click_on "Back"
  end

  test "should update Strain" do
    visit strain_url(@strain)
    click_on "Edit this strain", match: :first

    fill_in "Average rating", with: @strain.average_rating
    fill_in "Category", with: @strain.category
    fill_in "Distance", with: @strain.distance
    fill_in "Flower svg", with: @strain.flower_svg
    fill_in "Name", with: @strain.name
    fill_in "Nug image", with: @strain.nug_image
    fill_in "Phenotype", with: @strain.phenotype
    fill_in "Review count", with: @strain.review_count
    fill_in "Short description", with: @strain.short_description
    fill_in "Slug", with: @strain.slug
    fill_in "Subtitle", with: @strain.subtitle
    fill_in "Thc", with: @strain.thc
    fill_in "Top effect", with: @strain.top_effect
    fill_in "Top terp", with: @strain.top_terp
    click_on "Update Strain"

    assert_text "Strain was successfully updated"
    click_on "Back"
  end

  test "should destroy Strain" do
    visit strain_url(@strain)
    click_on "Destroy this strain", match: :first

    assert_text "Strain was successfully destroyed"
  end
end
