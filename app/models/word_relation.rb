class WordRelation < ActiveRecord::Base
  belongs_to :word
  belongs_to :relation, class_name: 'Word'
end