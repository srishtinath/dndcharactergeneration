require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co/api'

    def classes
        @request_hash = self.class.get('/classes').parsed_response
        # byebug
        @request_hash["results"].map do |name|
            name["name"]
        end
    end
# byebug
end

# api = DndApi.new 
# byebug
# api.classes
# byebug
