require 'spec_helper'

describe WinesController do

  describe '#index' do
    it 'GET /wines routes to WinesController#index' do
      {get: '/wines'}.should route_to controller: 'wines', action: 'index'
    end

    it 'sets instance variable correctly' do
      3.times { FactoryGirl.create(:wine) }
      get :index

      assigns(:wines).should_not be_nil
      assigns(:wines).size.should == 3
    end

    it 'renders :index view' do
      get :index

      response.should render_template :index
    end
  end

  describe '#new' do
    it 'GET /wines/new routes to WinesController#new' do
      {get: '/wines/new'}.should route_to controller: 'wines', action: 'new'
    end

    it 'sets instance variable' do
      get :new

      assigns(:wine).should_not be_nil
    end

    it 'renders :new view' do
      get :new

      response.should render_template :new
    end
  end

  describe '#create' do
    it 'POST /wines' do
      {post: '/wines'}.should route_to controller: 'wines', action: 'create'
    end

    describe 'successfully creates new wine' do
      before do
        get :create, wine: {name: 'test wine', item_no: 123}
      end

      it 'sets instance variable correctly' do
        assigns(:wine).should_not be_nil
        assigns(:wine).name.should == 'test wine'
        assigns(:wine).persisted?.should be_true
      end

      it 'redirects to :wine view' do
        response.should redirect_to(wine_url(assigns(:wine)))
      end
    end

    describe 'fails creating new wine' do
      before do
        get :create, wine: {}
      end

      it 'instance variable set is not persisted' do
        assigns(:wine).persisted?.should be_false
      end

      it 'renders :new view' do
        response.should render_template :new
      end
    end
  end

  describe '#show' do
    it 'GET /wines/1 routes to WinesController#show' do
      {get: '/wines/1'}.should route_to controller: 'wines', action: 'show', id: '1'
    end

    describe 'finds wine' do
      before do
        FactoryGirl.create(:wine, id: 1, name: 'test wine')
        get :show, id: '1'
      end

      it 'sets instance variable correctly' do
        assigns(:wine).should_not be_nil
        assigns(:wine).name.should == 'test wine'
      end

      it 'renders :show view' do
        response.should render_template :show
      end
    end

    describe 'does not find wine' do
      it 'raises exception' do
        lambda { get :show, id: '1' }.should raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#edit' do
    it 'GET /wines/1/edit routes to WinesController#edit' do
      {get: '/wines/1/edit'}.should route_to controller: 'wines', action: 'edit', id: '1'
    end

    describe 'finds wine' do
      before do
        FactoryGirl.create(:wine, id: 1, name: 'test wine')
        get :edit, id: 1
      end

      it 'sets instance variable correctly' do
        assigns(:wine).should_not be_nil
        assigns(:wine).name.should == 'test wine'
      end

      it 'renders :edit view' do
        response.should render_template :edit
      end
    end

    describe 'does not find wine' do
      it 'raises exception' do
        lambda { get :edit, id: 1 }.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#update' do
    it 'PUT /wines/1 routes to WinesController#update' do
      {put: '/wines/1'}.should route_to controller: 'wines', action: 'update', id: '1'
    end

    describe 'successfully updates wine' do
      before do
        FactoryGirl.create(:wine, id: 1)
        put :update, id: 1, wine: { name: 'new wine' }
      end

      it 'sets instance variable successfully' do
        assigns(:wine).should_not be_nil
        assigns(:wine).name.should == 'new wine'
        assigns(:wine).persisted?.should be_true
      end

      it 'redirects to wine_url' do
        response.should redirect_to wine_url
      end
    end

    describe 'fails udpating wine' do
      before do
        FactoryGirl.create(:wine, id: 1)
        put :update, id: 1, wine: { name: nil }
      end

      it 'cannot tell anything is wrong by looking at instance variable' do
        assigns(:wine).should_not be_nil
        assigns(:wine).persisted?.should be_true
      end

      it 'renders :edit view' do
        response.should render_template :edit
      end
    end
  end

  describe '#destroy' do
    it 'DELETE /wines/1 routes to WinesController#destroy' do
      {delete: '/wines/1'}.should route_to controller: 'wines', action: 'destroy', id: '1'
    end
  end

end