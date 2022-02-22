require 'swagger_helper'

RSpec.describe 'api/thecnicians', type: :request do
  path '/api/thecnicians' do
    get 'Get a list of all thecnicians' do
      tags 'thecnicians'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: { type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            last_name: { type: :string },
            mother_last_name: { type: :string },
            birth_date: { type: :string, format: :date },
            sex: { type: :boolean },
            email: { type: :string },
            thecnicians_phones: { type: :array, items: { type: :object, properties: { description: { type: :string }, number: { type: :string } } } }
          }
        }
        run_test!
      end
    end

    post 'Creates a thecnician' do
      tags 'thecnicians'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :thecnician, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'Jaime' },
          last_name: { type: :string, default: 'Jimenez' },
          mother_last_name: { type: :string, default: 'Juarez' },
          birth_date: { type: :string, format: :date },
          sex: { type: :boolean, default: false },
          email: { type: :string, default: 'example@mail.com' },
          thecnician_phones_attributes: {
            type: :array,
            items: {
              type: :object, properties: {
                description: { type: :string, default: 'cel' },
                number: { type: :string, default: '0123456789' }
              }
            }
          }
        },
        required: ['name', 'last_name', 'birth_date', 'sex']
      }

      response '201', 'thecnician created' do
        run_test!
      end

    end

  end

  path '/api/thecnicians/{id}' do
    get 'find specific thecnician' do
      tags 'thecnicians'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'thecnician found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          last_name: { type: :string },
          mother_last_name: { type: :string },
          birth_date: { type: :string, format: :date },
          sex: { type: :boolean },
          email: { type: :string },
          thecnicians_phones: { type: :array, items: { type: :object, properties: { description: { type: :string }, number: { type: :string } } } }
        },
        required: [ 'id' ]
        run_test!
      end
    end

    put 'Updates thecnician data' do
      tags 'thecnicians'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :thecnician, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, default: 'Jaime' },
          last_name: { type: :string, default: 'Jimenez' },
          mother_last_name: { type: :string, default: 'Juarez' },
          birth_date: { type: :string, format: :date },
          sex: { type: :boolean, default: false },
          email: { type: :string, default: 'example@mail.com' },
          thecnician_phones_attributes: {
            type: :array,
            items: {
              type: :object, properties: {
                description: { type: :string, default: 'cel' },
                number: { type: :string, default: '0123456789' }
              }
            }
          }
        },
        required: [ 'id', 'name', 'last_name', 'sex', 'birth_date' ]
      }

      response '200', 'thecnician updated' do
        run_test!
      end
    end

    delete 'Deletes a technician' do
      tags 'thecnicians'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'thecnician updated' do
        run_test!
      end
    end
  end
end
