require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { FactoryGirl.create(:event, user: create(:user)) }

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  describe 'Event associations' do
    it { expect(event).to belong_to(:user)}
  end

  describe 'Event validations' do
    it { expect(event).to validate_presence_of(:user) }
    it { expect(event).to validate_presence_of(:url) }
    it { expect(event).to validate_inclusion_of(:action).in_array(['Visit', 'SignIn', 'SignOut']) }
  end
end
