require "httparty"

class Item
  include HTTParty
  base_uri "https://api.thecatapi.com/v1"

  def self.fetch_data(query = "")
    response = get("/breeds", headers: { "x-api-key" => "live_dzom6KCFel0Ft3lVWBQdKgiJHLJ3oscDrPMWVfRTuL4dtqyxKFY2DvPm5JKzy4Ej" })
    return [] if response.code != 200

    cats = response.parsed_response

    if query.present?
      cats.select! { |cat| cat["name"].downcase.include?(query.downcase) }
    end

    cats.map do |cat|
      image_url = cat["image"] ? cat["image"]["url"] : "https://via.placeholder.com/100"
      Item.new(name: cat["name"], description: cat["description"], image_url: image_url)
    end
  end

  attr_accessor :name, :description, :image_url

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @image_url = attributes[:image_url]
  end
end
