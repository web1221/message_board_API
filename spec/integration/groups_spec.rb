# spec/integration/groups_spec.rb
require 'swagger_helper'

describe 'Groups API' do

  path '/groups' do

    post 'Creates a group' do
      tags 'Groups'
      consumes 'application/json', 'application/xml'
      parameter name: :group, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name']
      }

      response '201', 'group created' do
        let(:group) { { name: 'Dodo'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:group) { { } }
        run_test!
      end
    end

    path '/groups/{id}' do

      get 'Retrieves a group' do
        tags 'Groups'
        produces 'application/json', 'application/xml'
        parameter name: :id, :in => :path, :type => :string

        response '200', 'group found' do
          schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

          let(:id) { Group.create(name: 'foo').id }
          run_test!
        end

        response '404', 'group not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
