Word.delete_all
WordRoot.delete_all

grandparent = Word.create!(spelling: 'grandparent', definition: 'highest node in the family tree')
parent = Word.create!(spelling: 'parent', definition: 'middle node with both roots and rooteds')
child = Word.create!(spelling: 'child', definition: 'word with one root')
distant_relative = Word.create!(spelling: 'distant relative', definition: 'is related to the grandparent node but not not through a chain of parents')

grandparent.rooteds << parent
child.roots << parent
distant_relative.roots << grandparent

grandparent.save!
parent.save!
child.save!
distant_relative.save!