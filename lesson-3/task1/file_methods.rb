def index
  file = "students.txt"
  File.foreach(file) { |student| puts student }
end

def find(id)
  file = "students.txt"
  File.foreach(file).with_index do |student, index|
    if id == index
      puts student
    end
  end
end

def where(pattern)
  file = "students.txt"
  File.foreach(file).with_index do |student, index|
    if student.include?(pattern)
      puts index
    end
  end
end

def update(id, text)
  students = "students.txt"
  buffer = File.open("buffer.txt", "w")
  File.foreach(students).with_index do |student, index|
    buffer.puts((id == index) ? text : student)
  end
  buffer.close
  File.write(students, File.read(buffer))
  File.delete(buffer)
end

def delete(id)
  students = "students.txt"
  buffer = File.open("buffer.txt", "w")
  File.foreach(students).with_index do |student, index|
    if id != index
      buffer.puts(student)
    end
  end
  buffer.close
  File.write(students, File.read(buffer))
  File.delete(buffer)
end

def create(name)
  File.open("students.txt", "a") do |file|
    file.write(name)
  end
end
