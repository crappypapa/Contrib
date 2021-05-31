require 'rails_helper'

RSpec.describe ContributionsController, type: :controller do
  describe 'GET #index' do
    before do
      User.create(username: 'Olaoluwa')
      session[:author_id] = 1
      get :index
    end
    it { should render_template('index') }
    it { should_not render_template('ungrouped') }
  end
  describe 'GET #ungrouped' do
    before do
      User.create(username: 'Olaoluwa')
      session[:author_id] = 1
      get :ungrouped
    end
    it { should render_template('ungrouped') }
    it { should_not render_template('index') }
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(new_user_path) }
  end
end
