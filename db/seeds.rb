# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Word.delete_all
WordRoot.delete_all

parent = Word.create!(spelling: 'leaf', definition: 'nonsense')
node = Word.create!(spelling: 'boombox', definition: 'sanity')
child = Word.create!(spelling: 'ladeeda', definition: 'bon')

wroot1 = WordRoot.create!(word: parent)
wroot2 = WordRoot.create!(word: node)

node.word_roots << wroot1
child.word_roots << wroot2

parent.save!
node.save!
child.save!


