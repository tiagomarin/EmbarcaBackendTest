require 'rails_helper'

RSpec.describe State, type: :model do
  it 'is valid with a valid name' do
    state = State.new(name: 'Paraná')
    expect(state).to be_valid
  end

  it 'is not valid without a name' do
    state = State.new(name: nil)
    expect(state).to_not be_valid
  end

  it 'is not valid with a name length less than 3' do
    state = State.new(name: 'Pa')
    expect(state).to_not be_valid
  end

  it 'is not valid with a name that starts with a blank space' do
    state = State.new(name: ' Paraná')
    expect(state).to_not be_valid
  end

  it 'is not valid with a name that ends with a blank space' do
    state = State.new(name: 'Paraná ')
    expect(state).to_not be_valid
  end

  it 'is not valid with a name that has double spaces between words' do
    state = State.new(name: 'Paraná  DoubleSpace')
    expect(state).to_not be_valid
  end

  it 'is not valid with a name that has numbers' do
    state = State.new(name: '7 Lagoas')
    expect(state).to_not be_valid
  end

  it 'is not valid if the name is not unique' do
    State.create(name: 'Paraná')
    duplicate_state = State.new(name: 'Paraná')
    expect(duplicate_state).to_not be_valid
  end

  it 'is case-insensitive unique' do
    State.create(name: 'Paraná')
    duplicate_state = State.new(name: 'paraná')
    expect(duplicate_state).to_not be_valid
  end

  it 'is not valid with special characters' do
    state = State.new(name: 'Para@na!')
    expect(state).to_not be_valid
  end

  it 'is not valid with a name length greater than 50' do
    state = State.new(name: 'A' * 51)
    expect(state).to_not be_valid
  end

  it 'can have multiple cities' do
    state = State.create(name: 'Paraná')
    city1 = City.create(name: 'City1', state: state)
    city2 = City.create(name: 'City2', state: state)

    expect(state.cities).to include(city1, city2)
  end
end
