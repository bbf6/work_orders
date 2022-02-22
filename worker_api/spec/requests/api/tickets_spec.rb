require 'swagger_helper'

RSpec.describe 'api/tickets', type: :request do
  path '/api/tickets' do
    get 'Get a list of all tickets' do
      tags 'tickets'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: { type: :object,
          properties: {
            id: { type: :integer },
            accident_date: { type: :string, format: 'date-time' },
            details: { type: :string },
            client_branch_id: { type: :integer },
            work_order_id: { type: :integer },
            client_branch: { type: :object,
              properties: {
                id: { type: :integer },
                address: { type: :string },
                email: { type: :string },
                client_manager_id: { type: :integer },
                client_id: { type: :integer },
                client: { type: :object, properties: { name: { type: :string } } },
                client_manager: { type: :object, properties: { name: { type: :string }, last_name: { type: :string }, mother_last_name: { type: :string } } }
              }
            }
          }
        }
        run_test!
      end
    end

    post 'Creates a ticket' do
      tags 'tickets'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :ticket, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          accident_date: { type: :string, format: 'date-time' },
          details: { type: :string },
          client_branch_id: { type: :integer },
          work_order_id: { type: :integer }
        },
        required: ['accident_date', 'details', 'client_branch_id']
      }

      response '201', 'ticket created' do
        run_test!
      end

    end

  end

  path '/api/tickets/{id}' do
    get 'find specific ticket' do
      tags 'tickets'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'ticket found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          accident_date: { type: :string, format: 'date-time' },
          details: { type: :string },
          client_branch_id: { type: :integer },
          work_order_id: { type: :integer },
          client_branch: { type: :object,
            properties: {
              id: { type: :integer },
              address: { type: :string },
              email: { type: :string },
              client_manager_id: { type: :integer },
              client_id: { type: :integer },
              client: { type: :object, properties: { name: { type: :string } } },
              client_manager: { type: :object, properties: { name: { type: :string }, last_name: { type: :string }, mother_last_name: { type: :string } } }
            }
          }
        }
        run_test!
      end
    end

    put 'updates ticket data' do
      tags 'tickets'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :ticket, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          accident_date: { type: :string, format: 'date-time' },
          details: { type: :string },
          client_branch_id: { type: :integer },
          work_order_id: { type: :integer }
        },
        required: ['accident_date', 'details', 'client_branch_id']
      }

      response '200', 'ticket updated' do
        run_test!
      end

    end
  end
end
