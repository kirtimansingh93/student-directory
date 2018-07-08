@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty,repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name , cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do # 4. Repeat from step 1
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
       save_students
    when "4"
      load_students
    when "9"
      exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again."
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}) #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

=begin
Open the file for writing.On every iteration we create a new array
with the student name and the cohort, that is, the information we
want to save to the file. We do this in order to convert it to a
comma-separated string on the next line. The join() method joins
all elements of the array it's called on together, using its argument
as a separator. Finally, we write the csv line to the file using the
familiar puts() method, except we call it on a file, so it writes to
the file and not on the screen.
=end
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

=begin
Open the file (this time for reading), then we read all lines
into an array and iterate over it. On every iteration we discard the
training new line character from the line, split it at the comma
(this will give us an array with two elements) and assign it to the name
and cohort variables. Once we have the name and the cohort, we create a
new hash and put it into the list of students.
Finally, we close the file.
=end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu()
