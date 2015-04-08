Word.delete_all
WordRoot.delete_all

grandparent = Word.create!(spelling: 'grandparent', definition: 'highest node in the family tree')
parent = Word.create!(spelling: 'parent', definition: 'middle node with both roots and rooteds')
child = Word.create!(spelling: 'child', definition: 'word with one root')

grandparent.rooteds << parent
child.roots << parent

grandparent.save!
parent.save!
child.save!