require "test_helper"

class StrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strain = strains(:one)
  end

  test "should get index" do
    get strains_url
    assert_response :success
  end

  test "should get new" do
    get new_strain_url
    assert_response :success
  end

  test "should create strain" do
    assert_difference("Strain.count") do
      post strains_url, params: { strain: { average_rating: @strain.average_rating, category: @strain.category, distance: @strain.distance, flower_svg: @strain.flower_svg, name: @strain.name, nug_image: @strain.nug_image, phenotype: @strain.phenotype, review_count: @strain.review_count, short_description: @strain.short_description, slug: @strain.slug, subtitle: @strain.subtitle, thc: @strain.thc, top_effect: @strain.top_effect, top_terp: @strain.top_terp } }
    end

    assert_redirected_to strain_url(Strain.last)
  end

  test "should show strain" do
    get strain_url(@strain)
    assert_response :success
  end

  test "should get edit" do
    get edit_strain_url(@strain)
    assert_response :success
  end

  test "should update strain" do
    patch strain_url(@strain), params: { strain: { average_rating: @strain.average_rating, category: @strain.category, distance: @strain.distance, flower_svg: @strain.flower_svg, name: @strain.name, nug_image: @strain.nug_image, phenotype: @strain.phenotype, review_count: @strain.review_count, short_description: @strain.short_description, slug: @strain.slug, subtitle: @strain.subtitle, thc: @strain.thc, top_effect: @strain.top_effect, top_terp: @strain.top_terp } }
    assert_redirected_to strain_url(@strain)
  end

  test "should destroy strain" do
    assert_difference("Strain.count", -1) do
      delete strain_url(@strain)
    end

    assert_redirected_to strains_url
  end
end
