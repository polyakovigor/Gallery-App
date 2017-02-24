require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:user)     { create :user }
  let(:category) { create :category }
  let(:image)    { create :image, category_id: category.id }

  before :each do
    sign_in user
    category.reload
    image.reload
  end

  describe 'GET #show' do
    it 'show image' do
      get :show, params: { id: image.to_param }
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET #edit' do
    it 'edit image' do
      get :edit, params: { id: image.to_param }
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:image) }
      it 'creates a new image' do
        expect { post :create, params: { image: { picture: [attributes_for(:image)[:picture]] }, category_id: category.id } }.to change(Image, :count).by(1)
      end

      it 'assigns a newly created image as @image' do
        post :create, params: { image: { picture: [attributes_for(:image)[:picture]] }, category_id: category.id }
        expect(assigns(:category).images.count).to eq 2
        expect(assigns(:category).images.map(&:title)).to include('test.png')
      end

      it 'redirects to the created image' do
        post :create, params: { image: { picture: [attributes_for(:image)[:picture]] }, category_id: category.id }
        expect(response).to redirect_to category_path(category.id)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:invalid_image) }
      it 'assigns a newly created but unsaved image as @image' do
        post :create, params: { image: { picture: [attributes_for(:invalid_image)[:picture]] }, category_id: category.id }
        expect(assigns(:category).images.count).to eq 2
        expect(assigns(:category).images.map(&:title)).to include('test.png')
      end

      it 're-renders the categories/show template' do
        post :create, params: { image: { picture: [attributes_for(:invalid_image)[:picture]] }, category_id: category.id }
        expect(response).to render_template('categories/show')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:image).merge(title: 'updated title') }
      it 'updates the requested image' do
        put :update, params: { id: image.to_param, image: valid_attributes }
        expect(assigns(:image).title).to eq('updated title')
      end

      it 'assigns the requested image as @image' do
        put :update, params: { id: image.to_param, image: valid_attributes }
        expect(assigns(:image)).to eq(image)
      end

      it 'redirects to the image' do
        put :update, params: { id: image.to_param, image: valid_attributes }
        expect(response).to redirect_to(image)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:invalid_image) }
      it 'assigns the image as @image' do
        put :update, params: { id: image.to_param, image: { picture: [attributes_for(:invalid_image)[:picture]] } }
        expect(assigns(:image)).to eq(image)
      end

      it 're-renders the edit template' do
        put :update, params: { id: image.to_param, image: { picture: [attributes_for(:invalid_image)[:picture]] } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the image' do
      expect { delete :destroy, params: { id: image.to_param} }.to change(Image, :count).by(-1)
    end

    it 'redirects to the images list' do
      delete :destroy, params: { id: image.to_param }
      expect(response).to redirect_to category_path(category.id)
    end
  end
end
