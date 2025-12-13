class Writing < ApplicationRecord
    has_one_attached :cover, dependent: :purge_later
    has_many :chapters, dependent: :destroy
    belongs_to :user

    enum :status, {
            ongoing: 0,
            completed: 1,
            hiatus: 2,
            dropped: 3,
            coming_soon: 4
    }
end
