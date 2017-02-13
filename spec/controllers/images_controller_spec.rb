require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  let(:category) { create :category }
  let(:image)  { create :image, category_id: category.id }

  before :each do
    category.reload
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

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_attribute) { attributes_for(:image).merge(title: 'updated title') }
      it 'updates the requested image' do
        put :update, params: {id: image.to_param, image: valid_attribute }
        expect(assigns(:image).title).to eq('updated title')
      end

      it 'assigns the requested image as @image' do
        put :update, params: {id: image.to_param, image: valid_attribute}
        expect(assigns(:image)).to eq(image)
      end

      it 'redirects to the image' do
        put :update, params: {id: image.to_param, image: valid_attribute}
        expect(response).to redirect_to(image)
      end
    end

    context 'with invalid params' do
      let(:invalid_attribute) {attributes_for(:invalid_image)}
      it 'assigns the image as @image' do
        put :update, params: {id: image.to_param, image: invalid_attribute}
        expect(assigns(:image)).to eq(image)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: image.to_param, image: invalid_attribute}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the image' do
      expect { delete :destroy, params: {id: image.to_param} }.to change(Image, :count).by(-1)
    end

    it 'redirects to the images list' do
      delete :destroy, params: {id: image.to_param}
      expect(response).to redirect_to category_path(category.id)
    end
  end
end
