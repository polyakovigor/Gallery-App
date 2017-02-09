require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:image) { create :image }

  before :each do
    image.reload
  end

  describe 'GET #show' do
    it 'show image' do
      get :show, params: {id: image.to_param}
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET #edit' do
    it 'edit image' do
      get :edit, params: {id: image.to_param}
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET #destroy' do
    it 'delete image' do
      get :destroy
      expect { delete :destroy, params: {id: image.to_param} }.to change(Image, :count).by(-1)
    end
  end
end
