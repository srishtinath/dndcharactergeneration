require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def classes
        request_hash = self.class.get('/api/classes').parsed_response
        request_hash["results"].each do |result|
            Job.create(index: result["index"], name: result["name"], url: result["url"])
        end
    end

    def class_details(job)
        @request_hash = self.class.get('/#{find_class.url}').parsed_response
    end
end

# api = DndApi.new 
# byebug
# api.classes
# byebug
