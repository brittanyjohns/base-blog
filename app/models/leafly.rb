class Leafly
  include HTTParty
  base_uri "consumer-api.leafly.com/api"
  # "https://consumer-api.leafly.com/api/strain_playlists/v2?&enableNewFilters=true&skip=0&take=18&lat=41.3722&lon=-82.1087"

  def initialize(take, skip = 0)
    @options = { query: { enableNewFilters: true, skip: skip, take: take, lat: 41.3722, lon: -82.1087 } }
  end

  def strains
    response = self.class.get("/strain_playlists/v2", @options)
    response["hits"]["strain"]
  end

  def strain_details(slug)
    # https://consumer-api.leafly.com/api/strains/v1/original-glue/reviews?skip=0&take=3&sort[0][upvotes_count]=desc
    response = self.class.get("/strains/v1/#{slug}/reviews", @options)
    response["data"]
  end
end
