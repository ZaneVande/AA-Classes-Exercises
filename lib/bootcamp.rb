class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teach)
    teachers.push(teach)
  end

  def enroll(person)
    if students.count < @student_capacity
        @students.push(person)
        return true
    end
    if students.count >= @student_capacity
        return false
    end
  end

  def enrolled?(name)
    if @students.include?(name)
        return true
    else
        return false
    end
  end

  def student_to_teacher_ratio
    (students.count / teachers.count)
  end

  def add_grade(name, grade)
    if enrolled?(name)
        @grades[name] << grade
        return true
    else
        return false
    end
  end

  def num_grades(name)
    @grades[name].length
  end

  def average_grade(name)
    if enrolled?(name) && num_grades(name) > 0
        @grades[name].sum / @grades[name].length
    end
  end
end
