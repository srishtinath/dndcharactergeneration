require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co/api'

    def classes
        Job.delete_all
        @request_hash = self.class.get('/classes').parsed_response
        @request_hash["results"].each do |result|
            Job.create(index: result["index"], name: result["name"], url: result["url"])
        end
    end

    # def class_details(job)
    #     @class_info = Job.find(index: job)
    #     @class_info.each
    #     @class_info["results"]["url"]
    #     @class_hash = 
    # end
end

# api = DndApi.new 
# byebug
# api.classes
# byebug
