class ItemsController < ApplicationController
  def index
  end

  def show
    @item = @client.items.find(:id => params[:id], :expand => "all")
  end
end
