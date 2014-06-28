require 'faraday'
#all them tumblr api calls here
#THEM RESPONSE ARE JSON
API_URL = 'https://api.tumblr.com/v2/blog/'

class TumblrScrapper
  def initialize (hostname,api_key)
    @hostname = hostname
    @api_key = api_key
    @conn = Faraday.new(:url => API_URL+hostname) do |faraday|
      faraday.request :url_encoded
      faraday.adapter :httpclient
    end
  end

  def likes(limit="",offset="") 
    response = @conn.get 'likes', { :api_key => @api_key, :limit => limit, :offset => offset}
    response.body
  end

  def followers(limit="",offset="")
    response = @conn.get 'followers', { :api_key => @api_key, :limit => limit, :offset => offset}
    response.body
  end

  def posts(type = "", id = "", tag = "", limit = "", offset = "", notes_info = "", filter = "")
    response = @conn.get 'posts', {:api_key => @api_key, :type => type, :id => id, :tag =>tag, :limit => limit, :offset => offset, :notes_info => notes_info, :filter => filter}
    response.body
  end
end

