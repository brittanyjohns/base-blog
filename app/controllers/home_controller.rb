class HomeController < ApplicationController
  require "httparty"
  # HTTParty::Basement.default_options.update(verify: false)

  # Use the class methods to get down to business quickly

  def index
  end

  def seed_data
    response = Leafly.new(60, Strain.all.count)
    @response_data = response.strains
    ActiveRecord::Base.transaction do
      @response_data.each do |strain_data|
        existing_strain = Strain.find_by(original_id: strain_data["id"])
        if existing_strain
          puts "\n\nskipping #{existing_strain.name}\n\n"
          next
        end
        strain = Strain.new
        strain.original_id = strain_data["id"]
        strain.name = strain_data["name"]
        strain.category = strain_data["category"]
        strain.average_rating = strain_data["averageRating"]
        strain.flower_svg = strain_data["flowerImageSvg"]
        strain.nug_image = strain_data["nugImage"]
        strain.phenotype = strain_data["phenotype"]
        strain.review_count = strain_data["reviewCount"]
        strain.short_description = strain_data["shortDescriptionPlain"]
        strain.slug = strain_data["slug"]
        strain.top_terp = strain_data["strainTopTerp"]
        strain.subtitle = strain_data["subtitle"]
        strain.thc = strain_data["thc"]
        strain.top_effect = strain_data["topEffect"]
        strain.distance = strain_data["distanceMi"]
        strain.save!
        strain_data["cannabinoids"].each do |key, value|
          c = Cannabinoid.new(display_name: value["displayName"], order: value["displayName"], percentile_25: value["percentile25"], percentile_50: value["percentile50"], percentile_75: value["percentile75"], strain_id: strain.id)
          c.save!
        end

        strain_data["effects"].each do |e_key, e_value|
          e = Effect.new(name: e_value["name"], icon: e_value["icon"], score: e_value["score"], type: e_value["type"], votes: e_value["votes"], strain_id: strain.id)
          e.save!
        end
        strain_data["terps"].each do |t_key, t_value|
          t = Terp.new(name: t_value["name"], description: t_value["description"], score: t_value["score"], strain_id: strain.id)
          t.save!
        end
      end
    end
    @strains = Strain.all
  end

  def strain_show
    puts "params['slug']: #{strain_params["id"]}"
    response = Leafly.new(1)
    @response_data = response.strain_details(strain_params["id"])

    # response = HTTParty.get("http://api.stackexchange.com/2.2/questions?site=stackoverflow")
    puts "PARAMS: #{params.inspect}"
    puts "\n\n@response_data: #{@response_data.inspect}"
  end

  def strain_params
    params.permit(:id)
  end
end
