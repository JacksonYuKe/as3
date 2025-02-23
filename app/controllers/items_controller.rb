class ItemsController < ApplicationController
  def index
    query = params[:query] || ""
    @items = Item.fetch_data(query)
  end

  def details
    @item = Item.fetch_data.find { |i| i.name == params[:name] }
  end
end
