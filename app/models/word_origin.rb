class WordOrigin < ApplicationRecord
  belongs_to :word
  belongs_to :origin, :class_name => 'Word'
end
