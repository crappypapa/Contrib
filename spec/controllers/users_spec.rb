require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it { should_not redirect_to(login_path) }
    it { should render_template('new') }
  end
end
