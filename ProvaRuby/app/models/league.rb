class League < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :description
    validates_presence_of :players
    validates_presence_of :status
    validates_uniqueness_of :name
end
