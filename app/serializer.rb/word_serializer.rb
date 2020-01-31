class WordSerializer < ActiveModel::Serializer
  attributes :spelling, :definition, :origins, :derived_froms, :derivations, :relations
end
