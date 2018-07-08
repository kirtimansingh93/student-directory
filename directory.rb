def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty,repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name , cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def interactive_menu
  students = [] # declare the variable students before the loop, setting
  # it to an empty array so that it is available during several iterations
  # of the loop.
  loop do # 4. Repeat from step 1
    # 1. Print menu and ask students what to do.
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 becasue we will be adding more items
    # 2. Read the input and save it into a vairiable.
    selection = gets.chomp
    # 3. Do what the user has asked.
    case selection
    when "1" # Input the students
      students = input_students
    when "2" # Show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again."
    end
  end
end

interactive_menu()
