Word.delete_all
WordRoot.delete_all

grandparent = Word.create!(spelling: 'grandparent', definition: 'highest node in the family tree')
parent = Word.create!(spelling: 'parent', definition: 'middle node with both roots and rooteds')
child = Word.create!(spelling: 'child', definition: 'word with one root')

wroot1 = WordRoot.create!(word: grandparent)
wroot2 = WordRoot.create!(word: parent)

parent.word_roots << wroot1 #parent's word_root id should be 1, the grandparent's word_id 
child.word_roots << wroot2 #similarly, child's word root id should be 2, the parent's word id. Instead, child.word_roots queries within word_roots for the word_id of child, and not parent. It's creating child as a wordroot, and referencing itself - which, looking at what I'm doing here, does make sense given this code, but it's not the functionality I desire.

grandparent.save!
parent.save!
child.save!
wroot1.save!
wroot2.save!