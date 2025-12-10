class Writing < ApplicationRecord
    has_one_attached :cover, dependent: :purge_later
    has_many :chapters, dependent: :destroy
end
