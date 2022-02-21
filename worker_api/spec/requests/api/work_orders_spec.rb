require 'swagger_helper'

RSpec.describe 'api/work_orders', type: :request do
  path '/api/work_orders/by_thecnician/{id}' do
    get 'Get all work_orders from a technician' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Works listed for technician' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          begining_attention_date: { type: :string, format: :date_time, description: 'Date when the technician starts the work.' },
          ending_attention_date: { type: :string, format: :date_time, description: 'Date of ending work.' },
          status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer },
          ticket: { type: :object, properties: {
              id: { type: :integer },
              accident_date: { type: :date, format: :datetime },
              client_branch_id: { type: :integer },
              details: { type: :string },
              work_order_id: { type: :integer },
              client_branch: { type: :object, properties: {
                  id: { type: :integer },
                  address: { type: :string },
                  email: { type: :string },
                  client: { type: :object, properties: {
                      id: { type: :integer },
                      name: { type: :string }
                    }
                  }
                }
              }
            }
          },
          retainer: { type: :object, properties: {
              id: { type: :integer },
              service_date: { type: :date, format: :datetime },
              client_branch_id: { type: :integer },
              work_order_id: { type: :integer },
              client_branch: { type: :object, properties: {
                  id: { type: :integer },
                  address: { type: :string },
                  email: { type: :string },
                  client: { type: :object, properties: {
                      id: { type: :integer },
                      name: { type: :string }
                    }
                  }
                }
              }
            }
          }
        }
        run_test!
      end
    end
  end

  path '/api/work_orders' do
    get 'Get a list of all work_orders' do
      tags 'work_orders'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          begining_attention_date: { type: :string, format: :date_time, description: 'Date when the technician starts the work.' },
          ending_attention_date: { type: :string, format: :date_time, description: 'Date of ending work.' },
          status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer }
        }
        let(:work_order) { Work_order.all }
        run_test!
      end
    end

    post 'Creates a work_order' do
      tags 'work_orders'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :work_order, in: :body, schema: {
        type: :object,
        properties: {
          status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer }
        },
        required: ['status', 'thecnician_id']
      }

      response '201', 'work_order created' do
        let(:work_order) { Work_order.create({ thecnician_id: 1, status: "pending" }) }
        run_test!
      end

      response '400', 'invalid data' do
        let(:work_order) { Work_order.create thecnician_id: nil }
        run_test!
      end

    end

  end

  path '/api/work_orders/{id}' do
    get 'find specific work_order' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'work_order found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string }
        },
        required: [ 'id' ]

        let(:id) { Work_order.create(name: 'Cemsi Policlínica').id }
        run_test!
      end
    end

    put 'updates work_order data' do
      tags 'work_orders'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :work_order, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'work_order updated' do
        let(:work_order) { Work_order.update(1, { thecnician_id: 1, begining_attention_date: '2022-03-01', status: "doing" }) }
        run_test!
      end

      response '400', 'invalid data' do
        let(:work_order) { Work_order.update(1, thecnician_id: nil) }
        run_test!
      end
    end
  end
end
