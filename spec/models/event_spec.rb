require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.create(:event, user: create(:user)) }

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is invalid with blank attributes' do
    expect(Event.create(action: '', user_id: '', url: '')).not_to be_valid
  end

  describe 'Event associations' do
    it { expect(event).to belong_to(:user) }
  end

  describe 'Event validations' do
    it { expect(event).to validate_presence_of(:user) }
    it { expect(event).to validate_presence_of(:url) }
    it { expect(event).to validate_inclusion_of(:action).in_array(%w[Visit SignIn SignOut]) }
  end
end
