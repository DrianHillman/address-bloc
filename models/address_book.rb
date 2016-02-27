require_relative 'entry'

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0

    entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end

    entries.insert(index, Entry.new(name, phone_number, email))

  end

  def remove_entry(name, phone_number, email)
    entries.each do |x|
      if  ( x.name == name ) &&
          ( x.phone_number == phone_number ) &&
          ( x.email == email )

          entries.delete(x)

        else
          "This entry does not exist in the database.\nNote: Be sure that your spelling is correct."
        end
    end

  end

end
