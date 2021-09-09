require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET /index' do
    it 'should return a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @people' do
      people = Person.all
      get :index
      expect(assigns(:people)).to eq(people)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST /upload_csv' do
    before :each do
      @file = fixture_file_upload('files/people.csv', 'application/csv')
    end

    it 'should return a successful response' do
      post :upload_csv, params: { person: { csv_file: @file } }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'should return a successful response' do
      post :create, params: { person: { first_name: 'Test', last_name: 'User', email: 'testuser@gmail.com',
                                        phone: '9909909909' } }, xhr: true
      expect(response).to be_successful
    end
  end
end
