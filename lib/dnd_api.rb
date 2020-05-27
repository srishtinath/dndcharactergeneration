require 'httparty'
require 'byebug'

class DndApi
    include HTTParty
    format :json

    base_uri 'https://www.dnd5eapi.co'

    def classes
        request_hash = self.class.get('/api/classes').parsed_response
        request_hash["results"].each do |result|
            Job.create(index: result["index"], name: result["name"])
        end
    end

    def description(url)
        @desc_hash = self.class.get(url).parsed_response
        @desc_hash["desc"][0]
    end

    def abilities_class(result)
        request_hash = self.class.get(result).parsed_response
        request_hash["class"]["name"]
    end

    def spell_class_info(url)
        @spell_hash = self.class.get(url).parsed_response
        @spell_hash["classes"]
    end

    def spells
        request_hash = self.class.get('/api/spells').parsed_response
        request_hash["results"].each do |result|
            @url = result["url"]
            @description = description(@url)
            @spell = Spell.create(name: result["name"], description: @description)
            
            @spell_info = spell_class_info(@url)
            related_jobs = @spell_info.map { |class_hash| class_hash["name"] }
            
            related_jobs.each do |class_name|
                @job = Job.find_by(name: class_name)
                JobSpell.create(job: @job, spell: @spell)
            end
        end
    end

    def abilities
        request_hash = self.class.get('/api/features').parsed_response
        request_hash["results"].each do |result|
            @url = result["url"]
            @description = description(@url)
            @job_name = abilities_class(@url)
            @job = Job.find_by(name: @job_name)
            Ability.create(name: result["name"], description: @description, job_id: @job.id)
        end
    end

end