# student array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# print list of students
puts "The students of Villains Academy"
puts "-------------"

# iterate over students array
students.each do |student|
  puts student
end

# print number of students
# print() does not automatically add new line characters to end of arguement
puts "Overall, we have #{students.count} great students"