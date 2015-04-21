require 'csv'

namespace :db do

  desc "import language and word data from fixtures"
  task :import => :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    import_languages
    import_words
  end

  def import_languages

    if Language.exists?
      puts 'cowardly refusing'
      return
    end

    path = Rails.root + 'db/fixtures/iso-639-3_20150330.tab'

    CSV.foreach(path, col_sep: "\t", headers: :first_row) do |row|
      Language.create!(iso_code: row['Id'], name: row['Ref_Name'])
    end

    puts "imported #{Language.count} language(s)"
  end

  def import_words
    if Word.exists?
      puts 'you cant just make up words'
      return
    end

    path = Rails.root + 'db/fixtures/eng.tsv'

    CSV.foreach(path, col_sep: "\t", quote_char: "\x00") do |row|
      left_lang, left_spelling = row[0].split(': ')
      right_lang, right_spelling = row[2].split(': ')
      relation = row[1]

      if !(Language.exists?(iso_code: left_lang) && Language.exists?(iso_code: right_lang))
        puts 'skipping row: ', row
        next
      end
      puts row

      left_word = find_or_create_word(left_lang, left_spelling)
      right_word = find_or_create_word(right_lang, right_spelling)

      if relation == 'rel:etymological_origin_of'
        if !left_word.origin_ofs.exists?(right_word.id)
          left_word.origin_ofs << right_word
        end 
      elsif relation == 'rel:etymology'
        if !left_word.origins.exists?(right_word.id)
          left_word.origins << right_word
        end 
      elsif relation == 'rel:is_derived_from'
        if !left_word.derived_froms.exists?(right_word.id)
          left_word.derived_froms << right_word
        end 
      elsif relation == 'rel:has_derived_form'
        if !left_word.derivations.exists?(right_word.id)
          left_word.derivations << right_word
        end 
      elsif relation == 'rel:etymologically_related'
        left_word.relate_to(right_word)
      end
    end
  end

  def find_or_create_word(language, spelling)
    lang = Language.find_by(iso_code: language)
    word = lang.words.find_by(spelling: spelling)
    if !word
      word = Word.create!(language: lang, spelling: spelling)
    end
    return word
  end

end









