require 'spec_helper'

describe User do
  it { should have_many :tweets }
  it { should validate_presence_of :email }
  it { should validate_presence_of :handle }
  # it { should validate_uniqueness_of :email }
  # it { should validate_uniqueness_of :handle }

  it 'sends a welcome email' do
    user = FactoryGirl.build :user
    expect(UserMailer).to receive(:signup_confirmation).with(user)
    user.save
  end
end

