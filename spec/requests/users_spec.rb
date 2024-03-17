require 'swagger_helper'

describe 'Users API' do

  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :registration, in: :body, schema: {
        type: :object,
        properties: {
          user: { 
            type: :object, 
            properties: {
              email: { type: :string },
              password: { type: :string }
            } 
          }
        }
      }

      response '200', 'user created' do
        let(:registration) { { user: {email: "test@email.com", password: "123123"} } }

        run_test!
      end

      response '422', 'email alread exists' do
        before do
          User.create(email: 'test@email.com', password: '123123')
        end
      
        let(:registration) { { user: {email: "test@email.com", password: "123123"} } }

        run_test!
      end

      response '422', 'invalid request' do        
        let(:registration) { { user: { email: 123 } } }
        run_test!
      end
    end
  end

  path '/users/login' do
    post 'Login' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :registration, in: :body, schema: {
        type: :object,
        properties: {
          user: { 
            type: :object, 
            properties: {
              email: { type: :string },
              password: { type: :string }
            } 
          }
        }
      }

      response '200', 'login soccessfully' do
        before do
          User.create(email: 'test@email.com', password: '123123')
        end

        let(:registration) { { user: {email: "test@email.com", password: "123123"} } }

        run_test!
      end

      response '422', 'email or password is invalid' do
        before do
          User.create(email: 'test@email.com', password: '123123')
        end
      
        let(:registration) { { user: {email: "test1@email.com", password: "1231231"} } }

        run_test!
      end
    end
  end
end