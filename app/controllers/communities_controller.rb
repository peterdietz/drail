class CommunitiesController < ApplicationController
  layout "application"

  def index
    @communities = @client.communities.top_communities
    render :layout => "application"

  end

  def show
    @community = @client.communities.find(:id => params[:id], :expand => "all")
    @subCommunities = @client.communities.sub_communities(:id => @community.id)
    @collections = @client.communities.collections(:id => @community.id)
    render :layout => "application"
  end
end
