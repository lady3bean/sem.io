class WordDerivation < ActiveRecord::Base
  belongs_to :word
  belongs_to :derived_from, :class_name => 'Word'
end
