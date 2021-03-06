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

def print_students_list
  @students.each do |hash|
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
  end
end

def print_with_index
  @students.each_with_index do |hash, index|
    puts "#{index + 1}. #{hash[:name]} (#{hash[:cohort]} cohort)"
  end
  puts ""
end

def print_footer
  puts msg_end_plural("Overall, we have #{@students.count} great student", @students.count)
  puts ""
end

def msg_end_plural(string, count)
  # concatenate an 's' to end of string if count is greater than 1
  count > 1 ? (string) : (string + "s")
end

def input_students

  puts "Enter a student name and hit enter"
  puts "Names can be added until you hit enter on a blank line"
  name = STDIN.gets.chomp
  
  while !name.empty? do
    
    @students << {name: name, cohort: :november}
    
    puts msg_end_plural("Now we have #{@students.count} student", @students.count)

    name = STDIN.gets.chomp
    
    # chomp can be replaced with the delete method if correct arguements are passed
    # name = gets.delete("\r\n")
  end
  
end

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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to students.csv"
  puts "4. Load list from students.csv"
  puts "9. Exit"
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
      if @students.count > 0
        show_students
      else
        puts "The directory is empty"
      end
    when "3"
      save_students
      puts "Students have been saved to students.csv"
    when "4"
      load_students
      puts "Students have been loaded from students.csv"
    when "9"
      exit
    else
      puts "Invalid Input, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

@students = []
try_load_students
interactive_menu

