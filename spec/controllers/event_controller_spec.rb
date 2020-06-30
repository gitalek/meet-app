# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  it do
    params = {
      event: {
        title: 'Party',
        description: 'Cool party!',
        location: 'johndoe@example.com',
        start_time: '2020-06-12 00:00:00 UTC',
        end_time: '2020-06-13 00:00:00 UTC',
        organizer_email: 'aoeu@aoue.oun',
        organizer_telegram: '@telega',
        link: ''
      }
    }
    is_expected.to permit(
      :title, :description, :location, :start_time,
      :end_time, :organizer_email, :organizer_telegram, :link
    )
      .for(:create, params: params)
      .on(:event)
  end

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to render_template :new }
    it 'returns success status' do
      expect(response.status).to eq 200
    end
  end

  describe 'GET #show' do
    let(:event) { create :event }
    before { get :show, params: { id: event.id } }

    it do
      is_expected
        .to route(:get, "/events/#{event.id}")
        .to(action: :show, id: event.id)
    end
    it { is_expected.to render_template :show }
    it 'returns success status' do
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    let(:event) { create :event }
    before { get :edit, params: { id: event.id } }

    it do
      is_expected
        .to route(:get, "/events/#{event.id}/edit")
        .to(action: :edit, id: event.id)
    end
    it { is_expected.to render_template :edit }
    it 'returns success status' do
      expect(response.status).to eq 200
    end
  end

  describe 'GET #index' do
    before { get :index }

    # ?! почему не работает вариант с '/events'
    it { is_expected.to route(:get, '/').to(action: :index) }
    it { is_expected.to render_template :index }
    it 'returns success status' do
      expect(response.status).to eq 200
    end
  end
end
