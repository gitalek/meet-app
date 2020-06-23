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
        :end_time, :organizer_email, :organizer_telegram, :link,
      ).
      for(:create, params: params).
      on(:event)
  end

  # describe 'GET #show' do
  #   before { get :show }
  #   it { is_expected.to render_template('show') }
  # end

  # it { is_expected.to route(:get, '/events').to(action: :index) }
  # it { is_expected.to route(:get, '/events/1').to(action: :show, id: 1) }
end
