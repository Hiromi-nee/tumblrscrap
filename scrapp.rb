require_relative 'api'
require 'json'
@tag = "hikasa youko"
@limit = "1"
@site = "sei.neesan.org"
def scrap(site,tag,limit,api_key)
  @site = site
  scrapper = TumblrScrapper.new(@site, api_key)
  scraps = scrapper.posts(type="photo", id="", @tag=tag, @limit=limit, fiter="text")
  usable_scraps = JSON.parse(scraps)
  #posts is an array 
  posts = usable_scraps["response"]["posts"]
  print posts.count.to_s + " results.\n"

  #find all the urls
  (0..posts.count-1).each do |count|
    if posts[count]["link_url"]
      print posts[count]["link_url"] + "\n"
    else
      #largest dimensions, multi photo post
      (0..posts[count]["photos"].count-1).each do | pcount |
        print posts[count]["photos"][pcount]["alt_sizes"][0]["url"] + "\n"
      end
    end
  end
end
