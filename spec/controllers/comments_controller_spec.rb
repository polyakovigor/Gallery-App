require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  render_views

  let(:user)     { create :user }
  let(:image)     { create :image }

  before :each do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:params) { { comment: { body: 'sadglkjgsda' }, image_id: image.id, format: :json } }

      it 'creates a new comment' do
        expect { post :create, params: params }.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        post :create, params: params
        expect(assigns(:comment).image).to eq image
        expect(assigns(:comment).user).to eq user
      end

      it 'assigns a newly created comment as @comment' do
        post :create, params: params

        expect(json).to eq ({'id'=>Comment.last.id, 'body'=>'sadglkjgsda', 'user_id'=> user.id, 'image_id'=>image.id})
      end
    end
  end
end
