require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  render_views
  let(:json) { JSON.parse(response.body) }


  let(:user)  { create :user }
  let(:category) { create :category }
  let(:image) { create :image, category_id: category.id }
  let(:like)  { create :like, user_id: user.id, image_id: image.id }

  before :each do
    sign_in user
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'creates the like' do
        expect { post :create, params: { like: attributes_for(:like), format: :json } }.to change(Like, :count).by(1)
      end

      it 'responds with 201' do
        post :create, like: attributes_for(:like), format: :json
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the like' do
        post :create, like: attributes_for(:like, image: nil), format: :json
        expect(Like.count).to eq(0)
      end

      it 'responds with 422' do
        post :create, like: attributes_for(:like, image: nil), format: :json
        expect(response).to have_http_status(422)
      end
    end
  end

  describe '#destroy' do
    it 'destroy the like' do
      delete :destroy, like: attributes_for(:like), format: :json
      expect(Like.count).to eq(0)
    end

    it 'responds with 200' do
      delete :destroy, like: attributes_for(:like), format: :json
      expect(response).to have_http_status(200)
    end
  end
end
