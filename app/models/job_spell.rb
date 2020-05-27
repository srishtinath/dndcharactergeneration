class JobSpell < ApplicationRecord
    belongs_to :job
    belongs_to :spell
end
