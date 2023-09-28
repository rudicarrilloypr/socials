# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John', posts_counter: 2)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'has a posts_counter greater than or equal to 0' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end
end
