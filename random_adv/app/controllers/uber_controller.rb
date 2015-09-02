require "HTTParty"
class UberController < ApplicationController
	def index
	client_id = "ucWa1PKE9x4YgQ_xouwuZFHRW1H-gGw9"
	client_secret = "PrbeliotjJLysW2yDZq2eFqN7cR_YuGTEGcPUmgK"
	base_url = "https://login.uber.com/oauth/token"
    query ={
        'client_secret': client_secret,
        'client_id': client_id,
        'grant_type': 'authorization_code',
        'redirect_uri': 'http://localhost:3000/uber',
        'code': params[:code]
    }
    encoded_query = URI.encode_www_form(query)
    @url = base_url + "?" + encoded_query
    @response = HTTParty.post(@url)
    asstoken = @response["access_token"]


    base_urltwo = "https://sandbox-api.uber.com/v1/products?latitude=40.7401009&longitude=-73.9897396'"
    querytwo ={
        'Authorization: Bearer':  asstoken
    }
    encoded_querytwo = URI.encode_www_form(querytwo)
    @urltwo = base_urltwo + "?" + encoded_querytwo
    			
    @rs = HTTParty.put(@urltwo)
	end

end