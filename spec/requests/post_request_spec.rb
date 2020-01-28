require 'rails_helper'

describe "post a group route", :type => :request do

  before do
    post '/groups', params: { :name => 'test_name' }
  end

  it 'returns the group name' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
