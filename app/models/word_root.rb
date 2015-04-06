class WordRoot < ActiveRecord::Base
  belongs_to :word
  belongs_to :root, :class_name => 'Word', polymorphic: true
end
