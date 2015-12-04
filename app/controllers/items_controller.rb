class ItemsController < ApplicationController
  def index
  end

  def show
    client = Dspace::Client.new(:dspace_api => 'https://trydspace.longsight.com/rest')
    @item = client.items.find(:id => params[:id], :expand => "all")


  end
end
