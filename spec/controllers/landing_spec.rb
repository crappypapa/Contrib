require 'rails_helper'

RSpec.describe LandingController, type: :controller do
  describe 'GET #index' do
    before do
      User.create(username: 'Olaoluwa')
      session[:author_id] = 1
      get :index
    end
    it { should render_template('index') }
  end
end
