class UserStoriesController < ApplicationController

  def index
    require 'twitter'

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "hcpvTpHyD71k3LcGaG32cRbiC"
      config.consumer_secret     = "Cew3AjAhJ2wmaPqUPRJe4hguJP86GC6Rvv2jiagQ8mzNq0hYBm"
      config.access_token        = "888860061833076736-RzcWjBLJ3YOM3mtgset3Szwf2or1qdl"
      config.access_token_secret = "AGpK5tMnjp5KITv61JnLhkQr5h04tLINWPGWH11RZ1GKh"
    end
  end


end