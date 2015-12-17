class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #layout :application

  require 'dspace'

  def initialize
    @client = Dspace::Client.new(:dspace_api => Rails.application.config.dspace_rest_url)

    if !@client.is_running?
      raise 'Can\'t connect to DSpace API.'
    end

  end


  def login
    # authenticate
    @client.login 'dspace@dspace.org', 'secret'
  end

end
