require 'rspec'
require 'term'

describe Term do
  before do
    Term.clear
  end

  describe '#initialize' do
    it 'creates an instance of Term' do
      test_term = Term.new("word", "definition")
      test_term.should be_an_instance_of Term
    end
    it 'creates an array that includes the definition' do
      test_term = Term.new("cat", "animal")
      test_term.definition.should eq ["animal"]
    end
  end

  describe '.all' do
    it 'is an empty array' do
      Term.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a term to the array' do
      test_term = Term.new('word', 'definition')
      test_term.save
      Term.all.should eq [test_term]
    end
  end

  describe '.clear' do
    it 'clears the array before each spec is run' do
      test_term = Term.new('word', 'definition')
      test_term.save
      Term.clear
      Term.all.should eq []
    end
  end

  describe '.create' do
    it 'creates an instance of Term' do
      test_term = Term.create('word', 'definition')
      test_term.should be_an_instance_of Term
    end

    it 'saves a new instance to the array' do
      test_term = Term.create('word', 'definition')
      Term.all.should eq [test_term]
    end
  end

  describe '.search' do
    it 'uses a word to find its term' do
      test_term1 = Term.create('apple', 'fruit')
      test_term2 = Term.create('carrot', 'vegetable')
      Term.search('apple').should eq test_term1
    end

    it 'returns false if it does not find a word' do
      test_term1 = Term.create('apple', 'fruit')
      Term.search('candy').should eq nil
    end
  end

  describe '#full_entry' do
    it 'displays the word and definition together' do
      test_term = Term.create("word", "definition")
      test_term.full_entry.should eq 'word: definition'
    end
  end

  describe 'delete' do
    it 'finds a term and deletes it' do
      test_term1 = Term.create('delete', 'to remove')
      test_term2 = Term.create('keep', 'leave alone')
      test_term1.delete
      Term.all.should eq [test_term2]
    end
  end

  describe 'edit' do
    it 'finds a term and edits it' do
      test_term = Term.create('at', 'an animal')
      test_term.edit('cat', 'a mean animal')
      test_term.word.should eq 'cat'
    end
  end
end

















