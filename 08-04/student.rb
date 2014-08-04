class Student
  def initialize(name)
    @name = name
  end

  # attr_reader :name
  def name
    @name
  end

  # attr_writer :name
  def name= new_name
    @name = new_name
  end

  # together attr_accessor = attr_reader + attr_writer
end
