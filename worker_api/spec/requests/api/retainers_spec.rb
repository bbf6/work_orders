require 'swagger_helper'

RSpec.describe 'api/retainers', type: :request do
  path '/api/retainers' do
    get 'Get a list of all retainers' do
      tags 'retainers'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: { type: :object,
          properties: {
            id: { type: :integer },
            service_date: { type: :string, format: 'date-time' },
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

    post 'Creates a retainer' do
      tags 'retainers'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :retainer, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          service_date: { type: :string, format: 'date-time' },
          client_branch_id: { type: :integer },
          work_order_id: { type: :integer }
        },
        required: ['service_date', 'client_branch_id']
      }

      response '201', 'retainer created' do
        run_test!
      end

    end

  end

  path '/api/retainers/{id}' do
    get 'find specific retainer' do
      tags 'retainers'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'retainer found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          service_date: { type: :string, format: 'date-time' },
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

    put 'updates retainer data' do
      tags 'retainers'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :retainer, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          service_date: { type: :string, format: 'date-time' },
          client_branch_id: { type: :integer },
          work_order_id: { type: :integer }
        },
        required: ['service_date', 'client_branch_id']
      }

      response '200', 'retainer updated' do
        run_test!
      end

    end
  end
end
