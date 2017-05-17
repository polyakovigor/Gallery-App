require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { FactoryGirl.create(:comment, user: create(:user)) }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  describe 'Comment associations' do
    it { expect(comment).to belong_to(:user)}
    it { expect(comment).to belong_to(:image)}
  end

  describe 'Comment validations' do
    it { expect(comment).to validate_presence_of(:user) }
    it { expect(comment).to validate_presence_of(:body) }
    it { expect(comment).to validate_presence_of(:image) }
    it { expect(comment).to validate_length_of(:body).is_at_most(140) }
  end

end
