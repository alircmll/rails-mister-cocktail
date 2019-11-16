class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
  # before_save :default_values

  # def default_values
  #   self.photo = photo.presence || 'https://images.unsplash.com/photo-1455621481073-d5bc1c40e3cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1183&q=80'
  # end
end
  # validates :photo, allow_nil: true
