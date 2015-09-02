require "HTTParty"
class UberController < ApplicationController
    def index
    client_id = "ucWa1PKE9x4YgQ_xouwuZFHRW1H-gGw9"
    client_secret = "h_9nd2BUa1LVvLWJ9T2gkWDJ8BUW9ITUsEVvVlgR"
    base_url = "https://login.uber.com/oauth/token"
    query ={
        'client_secret'=> client_secret,
        'client_id'=> client_id,
        'grant_type'=> 'authorization_code',
        'redirect_uri'=> 'http://localhost:3000/uber',
        'code'=> params[:code]
    }
    encoded_query = URI.encode_www_form(query)
    @url = base_url + "?" + encoded_query
    @response = HTTParty.post(@url)
    @asstoken = @response["access_token"]


    productcar = 'b8e5c464-5de2-4539-a35a-986d6e58f186'
    base_urltwo = "https://sandbox-api.uber.com/v1/requests/estimate"
    
    
    @urltwo = base_urltwo
                
    @rs = HTTParty.post(@urltwo , headers: {"Authorization" => "Bearer " + @asstoken , "Content-Type" => "application/json"} , body: "{\"product_id\" : \"#{productcar}\" , \"start_latitude\" : \"40.7401009\" , \"start_longitude\" : \"-73.9897396\" }")
    end

end
