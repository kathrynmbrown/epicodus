require 'spec_helper'

describe Food do
  it { should validate_presence_of :name }
  it { should validate_presence_of :calories }
  it { should validate_presence_of :carb_grams }
  it { should validate_presence_of :protein_grams }
  it { should validate_presence_of :fat_grams }
end
