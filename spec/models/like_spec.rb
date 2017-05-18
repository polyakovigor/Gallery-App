require 'rails_helper'

RSpec.describe Like, type: :model do

  context do
    subject { Like.new }

      describe 'Like associations' do
        it { belong_to(:user)}
        it { belong_to(:image)}
      end

      describe 'Like validations' do
        it { validate_presence_of(:user) }
        it { validate_presence_of(:image) }
        it { validate_uniqueness_of(:image).scoped_to(:user)}
      end
  end
end
