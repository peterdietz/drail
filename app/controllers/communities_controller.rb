class CommunitiesController < ApplicationController
  def index
    @communities = @client.communities.top_communities
  end

  def show
    @community = @client.communities.find(:id => params[:id], :expand => "all")
    @subCommunities = @client.communities.sub_communities(:id => @community.id)
    @collections = @client.communities.collections(:id => @community.id)
  end
end
