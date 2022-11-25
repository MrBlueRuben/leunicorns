class Unicorn < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  # include PgSearch::Model
  # multisearchable against: [:name, :species]

end

# include PgSearch::Model
# pg_search_scope :search_by_name_and_species,
#   against: [ :name, :species ],
#   using: {
#     tsearch: { prefix: true } # <-- now `superman batm` will return something!
#   }
