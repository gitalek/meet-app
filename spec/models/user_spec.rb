require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations checks' do
    it 'username field' do
      pending
      is_expected.to validate_presence_of(:username).on(:create)
    end

    it { is_expected.to validate_length_of(:username).is_at_most(40).on(:create) }
  end
end
