class League < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :description
    validates_presence_of :players
    validates_presence_of :status
    validates_presence_of :president_id
    validates_uniqueness_of :name
    has_many :users
end
