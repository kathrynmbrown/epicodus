class List

  attr_reader :id, :tasks
	def initialize(name, id=nil)
		@name = name
    @id = id
    @tasks = tasks
	end

	def name
		@name
	end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      lists << List.new(name, id)
    end
    lists
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_list)
    self.name == another_list.name && self.id == another_list.id
  end

  def self.tasks(list_id)
    results = DB.exec("SELECT * FROM tasks WHERE list_id = #{list_id};")
    tasks = []
    results.each do |result|
      name = result['name']
      tasks << Task.new(result)
    end
    tasks
  end
end


