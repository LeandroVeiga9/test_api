require 'swagger_helper'

describe 'Transactions API' do

  path '/transactions' do
    post 'Creates a transaction' do
      tags 'Transactions'
      security [ bearer_auth: [] ]
      consumes 'application/json'
      produces 'application/json'
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
      parameter name: :Authorization, in: :header, schema: {
        type: :string
      }

      response '201', 'transaction created' do
        let(:user) { User.create(email: 'test@gmail.com', password: '123123') }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }

        let(:transaction) { { card_number: 1234567890123456, card_expiration_date: "2025-11-10", cvv: 123, value_in_cents: 1000 } }

        run_test! focus: true
      end

      response '422', 'invalid request' do
        let(:user) { User.create(email: 'test@gmail.com', password: '123123') }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        
        let(:transaction) { { card_number: 'foo' } }
        run_test!
      end
    end
  end

  path '/transactions' do

    get 'Retrieves all transactions' do
      tags 'Transactions'
      security [ bearer_auth: [] ]
      produces 'application/json'
      parameter name: :Authorization, in: :header, schema: {
        type: :string
      }

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
                total_pages: { type: :integer, nullable: true },
                current_page: { type: :integer, nullable: true },
                next_page: { type: :integer, nullable: true },
                prev_page: { type: :integer, nullable: true }
              }
            }
          }

        let(:user) { User.create(email: 'test@gmail.com', password: '123123') }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        run_test!
      end
    end
  end

  path '/transactions/{id}' do

    get 'Retrieves a transaction' do
      tags 'Transactions'
      security [ bearer_auth: [] ]
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'Retrieves a transaction' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            card_number: { type: :integer },
            card_expiration_date: { type: :string, format: :datetime },
            cvv: { type: :integer },
            value_in_cents: { type: :integer }
          },
          required: [ 'id', 'card_number', 'card_expiration_date', 'cvv', 'value_in_cents' ]
        

        let(:user) { User.create(email: 'test@gmail.com', password: '123123') }
        let(:id) { Transaction.create(card_number: 1234567890123456, value_in_cents: 1000, card_expiration_date: '2025-10-10', cvv: 444, user_id: user.id).id }

        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        run_test!
      end

      response '404', 'transaction not found' do
        let(:user) { User.create(email: 'test@gmail.com', password: '123123') }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }

        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end