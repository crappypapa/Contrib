require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  it do
    should route(:get, '/')
      .to(controller: :landing, action: :index)
  end
  it do
    should route(:get, 'users/new')
      .to(controller: :users, action: :new)
  end
  it do
    should route(:get, '/login')
      .to(controller: :sessions, action: :new)
  end
  it do
    should route(:post, '/login')
      .to(controller: :sessions, action: :create)
  end
  it do
    should route(:get, '/logout')
      .to(controller: :sessions, action: :destroy)
  end
  it do
    should route(:get, '/ungrouped')
      .to(controller: :contributions, action: :ungrouped)
  end
  it do
    should route(:get, '/groups')
      .to(controller: :groups, action: :index)
  end
  it do
    should route(:get, '/groups/new')
      .to(controller: :groups, action: :new)
  end
  it do
    should route(:post, '/groups')
      .to(controller: :groups, action: :create)
  end
  it do
    should route(:get, '/groups/1')
      .to(controller: :groups, action: :show, id: 1)
  end
  it do
    should route(:get, '/contributions')
      .to('contributions#index')
  end
  it do
    should route(:get, '/contributions/new')
      .to('contributions#new')
  end
  it do
    should route(:post, '/contributions')
      .to('contributions#create')
  end
end
