class HomeController < ApplicationController
  require "httparty"
  # HTTParty::Basement.default_options.update(verify: false)

  # Use the class methods to get down to business quickly

  def index
  end

  def make_request
    response = Leafly.new("strains", 1)
    @response_data = response.strains

    # response = HTTParty.get("http://api.stackexchange.com/2.2/questions?site=stackoverflow")
    puts "PARAMS: #{params.inspect}"
    puts "\n\n@response_data: #{@response_data.inspect}"
  end

  def strain_show
    puts "params['slug']: #{strain_params["id"]}"
    response = Leafly.new("strains", 1)
    @response_data = response.strain_details(strain_params["id"])

    # response = HTTParty.get("http://api.stackexchange.com/2.2/questions?site=stackoverflow")
    puts "PARAMS: #{params.inspect}"
    puts "\n\n@response_data: #{@response_data.inspect}"
  end

  def strain_params
    params.permit(:id)
  end
end
