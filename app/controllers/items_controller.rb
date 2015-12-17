class ItemsController < ApplicationController
  def index
    render :layout => "application"
  end

  def show
    @item = @client.items.find(:id => params[:id], :expand => "all")
    render :layout => "application"
  end
end
