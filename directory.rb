# student array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(array)
  array.each do |hash|
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_with_index(array)
  array.each_with_index do |hash, index|
    puts "#{index + 1}. #{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_footer(array)
  puts "Overall, we have #{array.count} great students"
end

def input_students
  # create empty array
  students = []
  
  # request first name
  puts "Enter a student name and hit enter"
  puts "Names can be added until you hit enter on a blank line"
  name = gets.chomp
  
  # while name not empty repeat following block
  while !name.empty? do
    
    # add student hash to the students array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    
    # get another name from the user
    name = gets.chomp
  end
  
  # return user
  students
  
end

students = input_students
print_header
# print(students)
if students.count > 0
  print_with_index(students)
  print_footer(students)
else
  puts "The directory is empty"
end