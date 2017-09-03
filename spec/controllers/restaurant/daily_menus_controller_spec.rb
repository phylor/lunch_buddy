# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant::DailyMenusController, type: :controller do
  let(:lilly_jo) { Restaurant::LillyJo.create! }
  let!(:menu_today) { Restaurant::DailyMenu.create(restaurant: lilly_jo, date: Date.today, content: 'Schnitzel') }
  let!(:menu_yesterday) { Restaurant::DailyMenu.create(restaurant: lilly_jo, date: Date.yesterday, content: 'Fisch') }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'has application/json content type' do
      get :index
      expect(response.content_type).to eq('application/json')
    end

    it 'includes todays menus content' do
      get :index
      expect(response.body).to include(menu_today.content)
    end

    it 'does not include yesterdays menus content' do
      get :index
      expect(response.body).not_to include(menu_yesterday.content)
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      get :show, params: { id: menu_today.id }
      expect(response.status).to eq(200)
    end

    it 'has application/json content type' do
      get :show, params: { id: menu_today.id }
      expect(response.content_type).to eq('application/json')
    end

    it 'includes the specified menus content' do
      get :show, params: { id: menu_yesterday.id }
      expect(response.body).to include(menu_yesterday.content)
    end
  end
end
