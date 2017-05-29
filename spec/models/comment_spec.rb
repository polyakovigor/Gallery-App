require 'rails_helper'

RSpec.describe Comment, type: :model do

  context do
    subject { Comment.new }

    describe 'Comment associations' do
      it { belong_to(:user)}
      it { belong_to(:image)}
    end

    describe 'Comment validations' do
      it { validate_presence_of(:user) }
      it { validate_presence_of(:body) }
      it { validate_presence_of(:image) }
      it { validate_length_of(:body).is_at_most(140) }
    end
  end
end
