require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  let!(:employees) { create_list(:employee, 10) }
  let(:employee_id) { employees.first.id }

  describe "GET /api/v1/employees" do
    before { get '/api/v1/employees' }

    it 'returns employees' do
      expect(JSON.parse(response.body).size).to eq(10)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/employees/:id" do
    context 'when the employee exists' do
      before { get "/api/v1/employees/#{employee_id}" }

      it 'returns the employee' do
        expect(JSON.parse(response.body)['id']).to eq(employee_id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the employee does not exist' do
      before { get "/api/v1/employees/9999" }

      it 'returns an error message' do
        expect(JSON.parse(response.body)['error']).to eq('Employee not found')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /api/v1/employees" do
    let(:valid_attributes) { { employee: { name: 'John Doe', email: 'john@example.com' } } }

    context 'when the request is valid' do
      before { post '/api/v1/employees', params: valid_attributes }

      it 'creates an employee' do
        expect(JSON.parse(response.body)['name']).to eq('John Doe')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/employees', params: { employee: { name: 'John Doe' } } }

      it 'returns an error message' do
        expect(JSON.parse(response.body)['error']).to eq('Error in creating')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /api/v1/employees/:id" do
    let(:valid_attributes) { { name: 'Jane Doe', email: 'jane@example.com' } }

    context 'when the employee exists' do
      before { put "/api/v1/employees/#{employee_id}", params: valid_attributes }

      it 'updates the employee' do
        updated_employee = Employee.find(employee_id)
        expect(updated_employee.name).to eq('Jane Doe')
        expect(updated_employee.email).to eq('jane@example.com')
        expect(response.body).to eq("Employee Record updated")
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the employee does not exist' do
      before { put "/api/v1/employees/9999", params: valid_attributes }

      it 'returns an error message' do
        expect(JSON.parse(response.body)['error']).to eq('Employee not found')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "DELETE /api/v1/employees/:id" do
    context 'when the employee exists' do
      before { delete "/api/v1/employees/#{employee_id}" }

      it 'deletes the employee' do
        expect(response.body).to eq("Employee deleted successfully")
        expect(response).to have_http_status(:ok)
        expect(Employee.find_by(id: employee_id)).to be_nil
      end
    end

    context 'when the employee does not exist' do
      before { delete "/api/v1/employees/9999" }

      it 'returns an error message' do
        expect(JSON.parse(response.body)['error']).to eq('Employee not found')
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
