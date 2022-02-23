require 'swagger_helper'

RSpec.describe 'api/work_orders', type: :request do
  path '/api/work_orders/by_thecnician/{id}' do
    get 'Get all work_orders from a technician' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Works listed for technician' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
            ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
            status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
            thecnician_id: { type: :integer },
            ticket: { type: :object, properties: {
                id: { type: :integer },
                accident_date: { type: :string, format: 'date-time' },
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
                service_date: { type: :string, format: 'date-time' },
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
        }
        run_test!
      end
    end
  end

  path '/api/work_orders/mark_as_done/{id}' do
    put 'Mark a work as done' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'List found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
            ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
            status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
            thecnician_id: { type: :integer },
            ticket: { type: :object, properties: {
                id: { type: :integer },
                accident_date: { type: :string, format: 'date-time' },
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
                service_date: { type: :string, format: 'date-time' },
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

  path '/api/work_orders/list_pending' do
    get 'List all pending works' do
      tags 'work_orders'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
            ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
            status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
            thecnician_id: { type: :integer },
            ticket: { type: :object, properties: {
                id: { type: :integer },
                accident_date: { type: :string, format: 'date-time' },
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
                service_date: { type: :string, format: 'date-time' },
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
        }
        run_test!
      end
    end
  end

  path '/api/work_orders/list_done' do
    get 'List all done works' do
      tags 'work_orders'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
            ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
            status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
            thecnician_id: { type: :integer },
            ticket: { type: :object, properties: {
                id: { type: :integer },
                accident_date: { type: :string, format: 'date-time' },
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
                service_date: { type: :string, format: 'date-time' },
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
        }
        run_test!
      end
    end
  end

  path '/api/work_orders' do
    get 'Get a list of all work orders' do
      tags 'work_orders'
      produces 'application/json'
      response '200', 'List found' do
        schema type: :array, items: { type: :object,
          properties: {
            id: { type: :integer },
            begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
            ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
            status: { type: :integer, minimum: 1, maximum: 5, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
            thecnician_id: { type: :integer },
            thecnician: { type: :object, properties: {
                id: { type: :integer },
                name: { type: :string },
                last_name: { type: :string },
                mother_last_name: { type: :string },
                birth_date: { type: :string, format: :date },
                sex: { type: :boolean },
                email: { type: :string },
                thecnicians_phones: { type: :object, properties: {
                    description: { type: :string },
                    number: { type: :string }
                  }
                }
              }
            },
            ticket: { type: :object, properties: {
                id: { type: :integer },
                accident_date: { type: :string, format: 'date-time' },
                details: { type: :string }
              }
            },
            retainer: { type: :object, properties: {
                id: { type: :integer },
                service_date: { type: :string, format: 'date-time' }
              }
            }
          }
        }
        run_test!
      end
    end

    post 'Creates a work order' do
      tags 'work_orders'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :work_order, in: :body, schema: {
        type: :object,
        properties: {
          status: { type: :integer, minimum: 1, maximum: 5, default: 1, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer },
          ticket_id: { type: :integer },
          retainer_id: { type: :integer }
        },
        required: ['status', 'thecnician_id']
      }

      response '201', 'work_order created' do
        run_test!
      end

    end

  end

  path '/api/work_orders/{id}' do
    get 'Find a specific work order' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'work_order found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
          ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
          status: { type: :integer, minimum: 1, maximum: 5, default: 1, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer },
          thecnician: { type: :object, properties: {
              id: { type: :integer },
              name: { type: :string },
              last_name: { type: :string },
              mother_last_name: { type: :string },
              birth_date: { type: :string, format: :date },
              sex: { type: :boolean },
              email: { type: :string },
              thecnicians_phones: { type: :object, properties: {
                  description: { type: :string },
                  number: { type: :string }
                }
              }
            }
          },
          ticket: { type: :object, properties: {
              id: { type: :integer },
              accident_date: { type: :string, format: 'date-time' },
              details: { type: :string }
            }
          },
          retainer: { type: :object, properties: {
              id: { type: :integer },
              service_date: { type: :string, format: 'date-time' }
            }
          }
        },
        required: [ 'id' ]
        run_test!
      end
    end

    put 'Updates work order data' do
      tags 'work_orders'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :work_order, in: :body, schema: {
        type: :object,
        properties: {
          begining_attention_date: { type: :string, format: 'date-time', description: 'Date when the technician starts the work.' },
          ending_attention_date: { type: :string, format: 'date-time', description: 'Date of ending work.' },
          status: { type: :integer, minimum: 1, maximum: 5, default: 1, description: 'The current status of the work pending: 1, doing: 2, paused: 3, done: 4, canceled: 5' },
          thecnician_id: { type: :integer },
          ticket_id: { type: :integer },
          retainer_id: { type: :integer }
        },
        required: ['name']
      }

      response '200', 'work_order updated' do
        run_test!
      end
    end

    delete 'Cancels a work order' do
      tags 'work_orders'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'work order updated' do
        run_test!
      end
    end
  end
end
