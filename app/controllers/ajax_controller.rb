class AjaxController < ApplicationController
  require 'net/http'
  require 'json'
  require 'cgi'
  
  def start
    respond_to do |format|
      format.js
    end
  end
  
  def add
    respond_to do |format|
      format.js
    end
  end
  
  def search
    query = CGI.escape(params[:q])
    query = 'http://api.punchfork.com/recipes?key=6a7ada90d46f7fc9&q=' + query
    data = JSON( Net::HTTP.get_response(URI.parse(query)).body )
    @thumb = data['recipes'].sample['thumb']
    
    respond_to do |format|
      format.js
    end
  end
end