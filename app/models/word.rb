class Word < ActiveRecord::Base
  has_many :word_roots
  has_many :roots, :through => :word_roots

  has_many :word_rooteds, :class_name => 'WordRoot', :foreign_key => 'root_id'
  has_many :rooteds, :through => :word_rooteds, :source => :word
end