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
  puts ""
end

def print_footer(array)
  puts msg_end_plural("Overall, we have #{array.count} great student", array.count)
end

def msg_end_plural(string, count)
  # concatenate an 's' to end of string if count is greater than 1
  count > 1 ? (string) : (string + "s")
end

def input_students
  
  puts "Enter a student name and hit enter"
  puts "Names can be added until you hit enter on a blank line"
  name = gets.chomp
  
  while !name.empty? do
    
    @students << {name: name, cohort: :november}
    
    puts msg_end_plural("Now we have #{@students.count} student", @students.count)

    name = gets.chomp
    
    # chomp can be replaced with the delete method if correct arguements are passed
    # name = gets.delete("\r\n")
  end
  
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print header
  print(students)
  print_footer(students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      if @students.count > 0
        print_header
        print_with_index(@students)
        print_footer(@students)
      else
        puts "The directory is empty"
      end
    when "9"
      exit
    else
      puts "Invalid Input, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

@students = []
interactive_menu

