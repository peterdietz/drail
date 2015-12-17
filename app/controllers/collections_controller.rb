class CollectionsController < ApplicationController
  def index
    @collections = @client.collections.all
    render :layout => "application"
  end

  def show
    @collection = @client.collections.find(:id => params[:id], :expand => "all")
    @items = @client.collections.items(:id => @collection.id)
    render :layout => "application"
  end
end
