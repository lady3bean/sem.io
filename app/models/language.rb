class Language < ApplicationRecord
  has_many :words

  validates :iso_code, uniqueness: true
end
