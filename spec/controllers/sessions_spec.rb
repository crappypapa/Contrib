require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it { should render_template('new') }
    it { should_not redirect_to(login_path) }
  end
end
