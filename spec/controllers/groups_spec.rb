require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'GET #index' do
    before do
      User.create(username: 'Olaoluwa')
      session[:author_id] = 1
      get :index
    end
    it { should render_template('index') }
    it { should_not render_template('show') }
  end
end
