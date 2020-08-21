# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { create :event }

  it do
    pending
    params = {
      event: {
        title: 'Party',
        description: 'Cool party!',
        location: 'johndoe@example.com',
        start_time: '2020-06-12 00:00:00 UTC',
        end_time: '2020-06-13 00:00:00 UTC',
        organizer_email: 'aoeu@aoue.oun',
        organizer_telegram: '@telega',
        link: '',
      }
    }
    is_expected.to permit(
      :title, :description, :location, :start_time,
      :end_time, :organizer_email, :organizer_telegram, :link
    )
      .for(:create, params: params)
      .on(:event)
  end

  context 'Member' do
    let(:user) { create :user }
    let(:event) { create :event, user: user }

    before(:each) do
      sign_in user
    end

    describe 'accessed to' do
      it '#new' do
        get :new
        is_expected.to respond_with(200)
      end

      it '#edit' do
        get :edit, params: { id: event.id }
        expect(response.status).to eq(200)
      end

      it '#destroy' do
        delete :destroy, params: { id: event.id }
        is_expected.to respond_with(302)
        expect(response).to redirect_to(events_path)
      end
    end

    context 'not his own events' do
      pending 'denied to' do
        it 'edit' do
          event = create(:event)
          get :edit, params: { id: event.id }
          expect {
            get :edit, params: { id: event.id }
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'destroy' do
        end
      end
    end
  end

  context 'Guest' do
    describe 'kicked from' do
      it '#new' do
        get :new
        expect(response.status).not_to eq(200)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be
      end

      it '#edit' do
        get :edit, params: { id: event.id }
        expect(response.status).not_to eq(200)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be
      end

      it '#destroy' do
        delete :destroy, params: { id: event.id }
        is_expected.not_to respond_with(200)
        is_expected.to respond_with(302)
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be
      end
    end

    describe 'accessed to' do
      it '#index' do
        get :index
        is_expected.to respond_with(200)
      end

      it '#show' do
        get :show, params: { id: event.id }
        is_expected.to respond_with(200)
      end
    end
  end
end
