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

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns all images as @images' do
      get :index, params: {}
      expect(assigns(:images)).to eq([image])
    end
  end

  describe 'GET #show' do
    it 'show image' do
      get :show, params: { id: image.to_param }
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET #new' do
    it 'assigns a new image to @image' do
      get :new, params: { category_id: category.to_param }
      expect(assigns(:image)).to be_a_new(Image)
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
        expect { post :create, params: { image: valid_attributes, category_id: category.id } }.to change(Image, :count).by(1)
      end

      it 'redirects to the category with new image' do
        post :create, params: { image: valid_attributes, category_id: category.id }
        expect(response).to redirect_to category_path(category.id)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:invalid_image) }

      it 'assigns a newly created but unsaved image as @image' do
        post :create, params: { image: invalid_attributes, category_id: category.id }
        expect(assigns(:image)).to be_a_new(Image)
      end

      it 're-renders the new template' do
        post :create, params: { image: invalid_attributes, category_id: category.id }
        expect(response).to render_template(:new)
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:image).merge(title: 'updated title') }
      it 'updates the requested image' do
        put :update, params: { id: image.id, image: valid_attributes }
        expect(assigns(:image).title).to eq('updated title')
      end

      it 'assigns the requested image as @image' do
        put :update, params: { id: image.id, image: valid_attributes }
        expect(assigns(:image)).to eq(image)
      end

      it 'redirects to the image' do
        put :update, params: { id: image.id, image: valid_attributes }
        expect(response).to redirect_to(image)
      end
    end

    context 'with invalid params' do
      it 'assigns the image as @image' do
        put :update, params: { id: image.id, image: attributes_for(:invalid_image) }
        expect(assigns(:image)).to eq(image)
      end

      it 're-renders the edit template' do
        put :update, params: { id: image.id, image: attributes_for(:invalid_image) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the image' do
      expect { delete :destroy, params: { category_id: category.to_param, id: image.to_param } }.to change(Image, :count).by(-1)
    end

    it 'redirects to the images list' do
      delete :destroy, params: { category_id: category.to_param, id: image.to_param }
      expect(response).to redirect_to category_path(category)
      expect(flash[:success]).to be_present
    end
  end
end
