require 'csv'

namespace :db do

  desc "import language and word data from fixtures"
  task :import => :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    import_languages
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
end