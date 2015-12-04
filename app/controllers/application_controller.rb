class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index
    require "dspace"
    client = Dspace::Client.new(dspace_api: 'https://trydspace.longsight.com/rest')

    if !client.is_running?
      raise 'Can\'t connect to DSpace API.'
    end

  # authenticate
    client.login 'dspace@dspace.org', 'secret'


  end

end
