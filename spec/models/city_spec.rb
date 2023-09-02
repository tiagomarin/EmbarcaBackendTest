require 'rails_helper'

RSpec.describe City, type: :model do
  it 'is valid with a valid name' do
    city = City.new(name: 'Curitiba')
    expect(city).to be_valid
  end

  it 'is not valid without a name' do
    city = City.new(name: nil)
    expect(city).to_not be_valid
  end

  it 'is not valid with a name length less than 3' do
    city = City.new(name: 'Pa')
    expect(city).to_not be_valid
  end

  it 'is not valid with a name that starts with a blank space' do
    city = City.new(name: ' Curitiba')
    expect(city).to_not be_valid
  end

  it 'is not valid with a name that ends with a blank space' do
    city = City.new(name: 'Curitiba ')
    expect(city).to_not be_valid
  end

  it 'is not valid with a name that has double spaces between words' do
    city = City.new(name: 'Curitiba  DoubleSpace')
    expect(city).to_not be_valid
  end

  it 'is not valid with a name that has numbers' do
    city = City.new(name: '7 Lagoas')
    expect(city).to_not be_valid
  end

  it 'is not valid if the name is not unique within the same state' do
    state = State.create(name: 'Paraná')
    City.create(name: 'Curitiba', state: state)
    duplicate_city = City.new(name: 'Curitiba', state: state)
    expect(duplicate_city).to_not be_valid
  end

  it 'is case-insensitive unique within the same state' do
    state = State.create(name: 'Paraná')
    City.create(name: 'Curitiba', state: state)
    duplicate_city = City.new(name: 'curitiba', state: state)
    expect(duplicate_city).to_not be_valid
  end

  it 'is not valid with special characters' do
    city = City.new(name: 'Curi@tiba!')
    expect(city).to_not be_valid
  end

  it 'is not valid with a name length greater than 50' do
    city = City.new(name: 'A' * 51)
    expect(city).to_not be_valid
  end
end
