require 'swagger_helper'

RSpec.describe 'api/clients', type: :request do
  path '/api/clients' do
    get 'Get a list of all clients' do
      tags 'clients'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: { type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            client_branches: { type: :array, items: { type: :object, properties: {
                  id: { type: :integer },
                  client_id: { type: :integer },
                  address: { type: :string },
                  email: { type: :string },
                  client_manager: { type: :object, properties: {
                      id: { type: :integer },
                      client_branch_id: { type: :integer },
                      name: { type: :string },
                      last_name: { type: :string },
                      mother_last_name: { type: :string },
                      client_manager_phones: { type: :array, items: { type: :object, properties: {
                            id: { type: :integer },
                            client_manager_id: { type: :integer },
                            description: { type: :string },
                            number: { type: :string }
                          }
                        }
                      }
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

    post 'Creates a client' do
      tags 'clients'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          client_branches_attributes: { type: :array, items: { type: :object, properties: {
                address: { type: :string },
                email: { type: :string },
                client_manager_attributes: { type: :object, properties: {
                    name: { type: :string },
                    last_name: { type: :string },
                    mother_last_name: { type: :string },
                    client_manager_phones_attributes: { type: :array, items: { type: :object, properties: {
                          description: { type: :string },
                          number: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        required: ['name']
      }

      response '201', 'client created' do
        run_test!
      end

    end

  end

  path '/api/clients/{id}' do
    get 'Find specific client' do
      tags 'clients'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Client found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          client_branches: { type: :array, items: { type: :object, properties: {
                id: { type: :integer },
                client_id: { type: :integer },
                address: { type: :string },
                email: { type: :string },
                client_manager: { type: :object, properties: {
                    id: { type: :integer },
                    client_branch_id: { type: :integer },
                    name: { type: :string },
                    last_name: { type: :string },
                    mother_last_name: { type: :string },
                    client_manager_phones: { type: :array, items: { type: :object, properties: {
                          id: { type: :integer },
                          client_manager_id: { type: :integer },
                          description: { type: :string },
                          number: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        required: [ 'id' ]
        run_test!
      end
    end

    put 'Updates client data' do
      tags 'clients'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          client_branches_attributes: { type: :array, items: { type: :object, properties: {
                address: { type: :string },
                email: { type: :string },
                client_manager_attributes: { type: :object, properties: {
                    name: { type: :string },
                    last_name: { type: :string },
                    mother_last_name: { type: :string },
                    client_manager_phones_attributes: { type: :array, items: { type: :object, properties: {
                          description: { type: :string },
                          number: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        required: ['name']
      }

      response '200', 'client updated' do
        run_test!
      end

    end

    delete 'Deletes a client' do
      tags 'clients'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'client deleted' do
        run_test!
      end
    end
  end
end
