Epicodus Assignment
==================

###Dictionary

Create a program that lets users create a dictionary. Read through all the requirements below, then implement them one at a time:

Start with a class called Term, that has instance variables for word and definition. For example, Term.new('carrot', 'A delicious vegetable.'). In your user interface, build ways to create terms, list the words, show their definition, edit them, and delete them.

As the dictionary gets bigger, it will be annoying to list out every single term. Instead, let users search for a word and get back the term: Term.search('carrot'). Don't just return the definition: return the entire object. This will make your program more extensible in the future.

Sometimes a word has more than one definition. Add support for multiple definitions: Term.new('carrot', ['A delicious vegetable', 'The first ingredient in my favorite cake.']). Now do you see why it's a good idea to return the entire object from your search?

Let's make our dictionary multilingual: allow multiple words for the same term. For example: Term.new(['carrot', 'zanahoria'], ['A delicious vegetable', 'The first ingredient in my favorite cake.']).

These arrays are starting to feel very cumbersome. And if we want to support definitions in multiple languages, things would get complicated quickly. Let's create two new classes: Word and Definition. Each one will have an instance variable to store the actual word or definition, and another one to store which language the word or definition is in. For example, Word.new('zanahoria', 'spanish').
