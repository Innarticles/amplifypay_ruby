module AmplifypayRuby
  module Utilities
    def http_json_request(baseurl,payload={})
      
      result = HTTP.headers('content_typet-Type' => "application/json", 'Cache-Control'=> "no-cache").post(baseurl, :json =>  payload)
      json_to_hash(result.to_s)
    end

    def http_get_request(baseurl)
    end

    def hash_to_json(params={})
      MultiJson.dump params
    end

    def json_to_hash(params={})
      MultiJson.load params
    end
  end
end