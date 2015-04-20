class Word < ActiveRecord::Base
  belongs_to :language

  has_many :word_origins
  has_many :origins, :through => :word_origin, :source => :origin

  has_many :word_origin_children, :class_name => 'WordOrigin', :foreign_key => 'origin_id'
  has_many :origin_ofs, :through => :word_origin_children, :source => :word
  
  has_many :word_derived_froms, :class_name => 'WordDerivation'
  has_many :derived_froms, :through => :word_derived_froms, :source => :derived_from

  has_many :word_derivations, :foreign_key => 'derived_from_id'
  has_many :derivations, :through => :word_derivations, :source => :word

  has_many :word_relations
  has_many :relations, :through => :word_relations, :source => :relation

  def relate_to(word)
    if self.relations.exists?(word.id)
      return
    end
    self.relations << word
    word.relations << self
  end

end