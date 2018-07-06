# let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked With of the West",
  "Terminator",
  "Freddy Kruerger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates"
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(names)
  names.each do |name|
    puts name
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end
print_header
prrint(students)
print_footer(students)
