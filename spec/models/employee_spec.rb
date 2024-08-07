require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is invalid without an email' do
    employee = Employee.new(email: nil)
    expect(employee).not_to be_valid
    expect(employee.errors[:email]).to include("can't be blank")
  end
  it 'is invalid with a duplicate email' do
    Employee.create!(email: 'test@example.com')
    duplicate_employee = Employee.new(email: 'test@example.com')
    expect(duplicate_employee).not_to be_valid
    expect(duplicate_employee.errors[:email]).to include("has already been taken")
  end
  it 'is valid with a unique email' do
    employee = Employee.new(email: 'unique@example.com')
    expect(employee).to be_valid
  end
end
