require 'swagger_helper'

describe 'Transactions API' do

  path '/transactions' do

    post 'Creates a transaction' do
      tags 'Transactions'
      consumes 'application/json'
      parameter name: :transaction, in: :body, schema: {
        type: :object,
        properties: {
          card_number: { type: :integer },
          card_expiration_date: { type: :string, format: :datetime },
          cvv: { type: :integer },
          value_in_cents: { type: :integer }
        },
        required: [ 'card_number', 'card_expiration_date', 'cvv', 'value_in_cents' ]
      }

      response '201', 'transaction created' do
        let(:transaction) { { title: 'foo', content: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:transaction) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/transactions' do

    get 'Retrieves all transactions' do
      tags 'Transactions'
      produces 'application/json'

      response '200', 'transaction found' do
        schema type: :object,
          properties: {
            transactions: { 
              type: :array, 
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  card_number: { type: :integer },
                  card_expiration_date: { type: :string, format: :datetime },
                  cvv: { type: :integer },
                  value_in_cents: { type: :integer }
                }
              } 
            },
            pagination: { 
              type: :object, 
              properties: { 
                total_pages: { type: :integer },
                current_page: { type: :integer },
                next_page: { type: :integer },
                prev_page: { type: :integer }
              }
            }
          }
        run_test!
      end
    end
  end

  path '/transactions/{id}' do

    get 'Retrieves a transaction' do
      tags 'Transactions'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'transaction found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            card_number: { type: :integer },
            card_expiration_date: { type: :string, format: :datetime },
            cvv: { type: :integer },
            value_in_cents: { type: :integer }
          },
          required: [ 'id', 'card_number', 'card_expiration_date', 'cvv', 'value_in_cents' ]
        

        let(:id) { Transaction.create(card_number: 1234567890123456, value_in_cents: 1000, card_expiration_date: '2025-10-10', cvv: 444).id }
        run_test!
      end

      response '404', 'transaction not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

end