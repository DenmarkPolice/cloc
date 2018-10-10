# Public: Send and return functions
#
# filnamn  - The chosen file to be read
#
# Examples
#
#   multiplex('Tom', 4)
#   # => 'TomTomTomTom'
#
# Returns the data from print_data_to_terminal
def main()
  filnamn = ARGV[0];
  text = read_source_file(filnamn:filnamn)
  print_data_to_terminal(text:text)
end

# Public: Takes the filename and returns the content of the file
#
# text  - The String to be duplicated.
#
# Examples
#
#   print_data_to_terminal(example_code.file)
#   # => Lines of text from the file
#
# Returns the text in an array
def read_source_file(filnamn:)
  text = IO.readlines(filnamn);
  return text;
end

# Public: Takes the text and returns data about it
#
# row_counter - Keeps count of which row is currently being targeted.
# empty_row_counter - Counts the number of empty rows.
# comment_row_counter - Counts the rows marked with comments.
# code_row_counter - Counts the number of rows with code.
#
# Examples
#
#   print_data_to_terminal(text:text)
#   # => Lines of Code: 4
#   # => Lines of Comments: 11
#   # => Empty Lines: 3
#   # => Total Lines: 18
#
# Returns the duplicated String.
def print_data_to_terminal(text:)
  row_counter = 0;
  empty_row_counter = 0;
  comment_row_counter = 0;

  while(text.length > row_counter)

    current_row = text[row_counter].split("");

    while(current_row[0] == " ")
      current_row.delete_at(0)
    end

    if(current_row[0] == "\n")
        empty_row_counter += 1;
    end

    if(current_row[0] == "#")
       comment_row_counter += 1;
    end
    row_counter += 1;
  end
  code_row_counter = text.length - empty_row_counter - comment_row_counter;
  puts "Lines of Code: #{code_row_counter}";
  puts "Lines of Comments: #{comment_row_counter}";
  puts "Empty Lines: #{empty_row_counter}";
  puts "Total Lines: #{text.length}"
end

main()
