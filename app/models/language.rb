class Language < ActiveRecord::Base
  has_many :words

  validates :iso_code, uniqueness: true
end