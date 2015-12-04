class CommunitiesController < ApplicationController
  def index
    require 'dspace'
    client = Dspace::Client.new(dspace_api: 'https://trydspace.longsight.com/rest')
    @communities = client.communities.top_communities
  end

  def show
    client = Dspace::Client.new(dspace_api: 'https://trydspace.longsight.com/rest')
    @community = client.communities.find(:id => params[:id], :expand => "all")
    @subCommunities = client.communities.sub_communities(:id => @community.id)
    @collections = client.communities.collections(:id => @community.id)
  end
end
