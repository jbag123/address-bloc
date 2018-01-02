require_relative '../models/address_book'

class MenuController
        attr_reader :address_book

        def initialize
                @address_book = AddressBook.new
        end

        def main_menu
                puts "Main Menu - #{address_book.entries.count} entries"
                puts "1 - View all entries"
                puts "2 - View entry number"
                puts "3 - Create an entry"
                puts "4 - Search for an entry"
                puts "5 - Import entries from a CSV"
                puts "6 - Exit"
                print "Enter your selection: "

                selection = gets.to_i

                case selection
                        when 1
                                system "clear"
                                view_all_entries
                                main_menu
                        when 2
                                system "clear"
                                view_entry_number
                                main_menu
                        when 3
                                system "clear"
                                create_entry
                                main_menu
                        when 4
                                system "clear"
                                search_entries
                                main_menu
                        when 5
                                system "clear"
                                read_csv
                                main_menu
                        when 6
                                puts "Good-bye"

                                exit(0)
                        else
                                system "clear"
                                puts "Sorry, this is not a valid input"
                                main_menu
                end
        end

        def view_all_entries
                address_book.entries.each do |entry|
                        system "clear"
                        puts entry.to_s
                        entry_submenu(entry)
                end

                system "clear"
                puts "End of entries"
        end

        def view_entry_number()
                # clear terminal
                system "clear"
                # set index to 1
                index = 1
                # loop over address entries
                # print out each entry
                # increment index
                address_book.entries.each do |entry|
                        p "#{index}: #{entry.name}"
                        index += 1
                end

                # set selection as one more count than index
                selection = index + 1

                # whilst selection is more than index print request
                until selection <= index
                        print "Please enter a valid selection from the options above: "
                        # set selection to input integer
                        selection = gets.to_i
                end

                # as input integer is now less than or equal to index set selection to equal the same as index
                selection = selection - 1
                # put entry to the screen based on selection 
                puts address_book.entries[selection].to_s
        end

        def create_entry
                system "clear"
                puts "New AddressBloc Entry"

                print "Name: "
                name = gets.chomp
                print "Phone number: "
                phone = gets.chomp
                print "Email: "
                email = gets.chomp

                address_book.add_entry(name,phone,email)

                system "clear"
                puts "New entry created"
        end

        def search_entries

        end

        def read_csv

        end

        def entry_submenu(entry)
                puts "n - next entry"
                puts "d - delete entry"
                puts "e - edit this entry"
                puts "m - return to main menu"

                selection = gets.chomp

                case selection
                        when "n"
                        when "d"
                        when "e"
                        when "m"
                                system "clear"
                                main_menu
                        else
                                system "clear"
                                puts "#{selection} is not a valud input"
                                entry_submenu(entry)
                end
        end
end
