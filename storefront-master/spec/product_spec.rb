require 'spec_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should have_attached_file(:productimage) }
  # it { should validate_attachment_content_type(:product_photo).
  # allowing('image/png', 'image/gif', 'image/jpg').
  # rejecting('text/plain', 'text/xml') }

end
