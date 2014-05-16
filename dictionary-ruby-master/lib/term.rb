class Term
  attr_reader :word, :definition

  @@all_terms = []

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def Term.search(word_search)
    found_term = []
    found_term = @@all_terms.select {|object| object.word == word_search}
    found_term[0]
  end

  def delete
    @@all_terms.delete(self)
  end

  def edit(edited_word, edited_definition)
    @word = edited_word
    @definition = edited_definition
  end

  def initialize(word, definition)
    @word = word
    @definition = [definition]
  end

  def save
    @@all_terms << self
  end

  def full_entry
    @word + ": " + @definition.join(', ')
  end


end
