class FinderController < ApplicationController
  def index
    @feed = get_feed
    @routes = @feed.routes.sort_by {|a| a.route_short_name.to_i}
  end
  
  def route
    @feed = get_feed
    @routes = @feed.routes.sort_by {|a| a.route_short_name.to_i}
    @routes.each do |route|
      
    end
  end
end
