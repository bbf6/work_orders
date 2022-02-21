require 'swagger_helper'

RSpec.describe 'api/clients', type: :request do
  path '/api/clients' do
    get 'Get a list of all clients' do
      tags 'clients'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string }
        }
        let(:client) { Client.all }
        run_test!
      end
    end

    post 'Creates a client' do
      tags 'clients'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'client created' do
        let(:client) { Client.create name: 'Cemsi Policlínica' }
        run_test!
      end

      response '400', 'invalid data' do
        let(:client) { Client.create name: nil }
        run_test!
      end

    end

  end

  path '/api/clients/{id}' do
    get 'find specific client' do
      tags 'clients'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Client found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string }
        },
        required: [ 'id', 'name' ]

        let(:id) { Client.create(name: 'Cemsi Policlínica').id }
        run_test!
      end
    end

    put 'updates client data' do
      tags 'clients'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'client updated' do
        let(:client) { Client.update(1, name: 'Default') }
        run_test!
      end

      response '400', 'invalid data' do
        let(:client) { Client.update(1, name: nil) }
        run_test!
      end
    end
  end
end
