require_relative 'entry'
require 'csv'
require 'bloc_record/base'

class AddressBook < BlocRecord::Base
  has_many :entries
  
  def add_entry(name, phone_number, email)
    Entry.create(name: name, phone_number: phone_number, email: email)
  end
  
  def find_entry(name)
    Entry.where(name: name, address_book_id: self.id).first
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
end
