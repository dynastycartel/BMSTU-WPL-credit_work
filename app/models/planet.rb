class Planet < ApplicationRecord
  has_one_attached :picture

  validates *%i[planet_name picture nearest_star_name distance_in_ly free_space], presence: true
  validates :planet_name, uniqueness: true
  validates :distance_in_ly, numericality: { greater_than_or_equal_to: 0 }
  validates :free_space, numericality: { greater_than: 0 }
end