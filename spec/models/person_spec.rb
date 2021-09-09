require 'rails_helper'

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {
    described_class.new(first_name: 'Test', last_name: 'User',
                        email: 'testuser@gmail.com', phone: '9909909909') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without valid email' do
    subject.email = 'testusergmail.com'
    expect(subject).to_not be_valid
  end

  it 'is not valid without valid phone' do
    subject.email = 'invaid009phone909number'
    expect(subject).to_not be_valid
  end
end
