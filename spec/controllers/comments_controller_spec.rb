require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:comment_1) { create :comment, image_id: image.id }
  let(:comment_2) { create :comment, image_id: image.id }
  let(:category) { create :category }
  let(:image) { create :image, category_id: category.id }
  let(:user) { create :user }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all comments as @comments' do
      get :index, params: {}
      expect(assigns(:comments)).to eq([comment_1, comment_2])
    end
  end
end
