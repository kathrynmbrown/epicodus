require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }

  # describe '.renumber'
  #   it 'should number itself according to the surrounding lesson numbers' do
  #     test_lesson_1 = Lesson.create({ name: 'Styling with Classes', lesson_text: 'Some Class Stuff.', sequence_id: 2 })
  #     test_lesson_1.save
  #     test_lesson_2 = Lesson.create({ name: 'Organizing with Divs', lesson_text: 'Some Div Stuff.', sequence_id: 3 })
  #     test_lesson_2.save
  #     test_lesson_3 = Lesson.create({ name: 'Laying out with Floats', lesson_text: 'Some Float Stuff.', sequence_id: 1 })
  #     test_lesson_3.save
  #     Lesson.renumber
  #     test_lesson_1.sequence_id.should eq 1
  #   end
end
