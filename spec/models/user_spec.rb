require 'spec_helper'
describe User do
  it 'is a user' do
    expect(User.new).to be_a(User)
  end
end