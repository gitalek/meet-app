require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:organizer_email) }

  it { is_expected.to validate_length_of(:title).is_at_most(75) }
end
