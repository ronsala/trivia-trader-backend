require 'rails_helper'

RSpec.describe 'Welcome', type: :feature do
  it 'returns http success' do
    visit "http://localhost:52330"
    byebug
    expect(response).to have_http_status(:success)
  end
end