class CollectionsController < ApplicationController
  def index
    client = Dspace::Client.new(:dspace_api => 'https://trydspace.longsight.com/rest')
    @collections = client.collections.all
  end

  def show
    client = Dspace::Client.new(:dspace_api => 'https://trydspace.longsight.com/rest')
    @collection = client.collections.find(:id => params[:id], :expand => "all")
    @items = client.collections.items(:id => @collection.id)
  end
end
