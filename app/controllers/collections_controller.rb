class CollectionsController < ApplicationController
  def index
    @collections = @client.collections.all
  end

  def show
    @collection = @client.collections.find(:id => params[:id], :expand => "all")
    @items = @client.collections.items(:id => @collection.id)
  end
end
