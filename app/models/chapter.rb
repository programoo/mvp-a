class Chapter < ApplicationRecord
    validates :title, presence: true

    belongs_to :writing
end
