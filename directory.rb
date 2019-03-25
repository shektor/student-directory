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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(array)
  array.each do |item|
    puts item
  end
end

def print_footer(array)
  puts "Overall, we have #{array.count} great students"
end

print_header
print(students)
print_footer(students)