class WordOrigin < ActiveRecord::Base
  belongs_to :word
  belongs_to :origin, :class_name => 'Word'
end
