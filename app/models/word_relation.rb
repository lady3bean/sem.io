class WordRelation < ApplicationRecord
  belongs_to :word
  belongs_to :relation, class_name: 'Word'
end
