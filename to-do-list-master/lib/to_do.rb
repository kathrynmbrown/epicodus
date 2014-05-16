class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def completed_task
    @description = "x " + @description
    @description
  end
end
