require 'rails_helper'

RSpec.describe "Exports", type: :request do
  describe "GET /exports.csv" do
    before do
      User.create(name: 'John Doe', email: 'john@example.com', image: 'http://example.com/john.jpg')
      User.create(name: 'Jane Smith', email: 'jane@example.com', image: 'http://example.com/jane.jpg')
    end
    it 'returns a CSV file' do
      get '/exports.csv'

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('text/csv')
    end

    it "includes the correct headers and content" do
      get '/exports.csv'

      csv = CSV.parse(response.body, headers: true)

      expect(csv.headers).to eq(["Name", "Email", "Image"])

      expect(csv[0]['Name']).to eq('John Doe')
      expect(csv[0]['Email']).to eq('john@example.com')
      expect(csv[0]['Image']).to eq('http://example.com/john.jpg')

      expect(csv[1]['Name']).to eq('Jane Smith')
      expect(csv[1]['Email']).to eq('jane@example.com')
      expect(csv[1]['Image']).to eq('http://example.com/jane.jpg')
    end
  end
end