require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:user)     { create :user }
  let(:category) { create :category }
  let(:image_1)  { create :image, category_id: category.id }
  let(:image_2)  { create :image, category_id: category.id }
  let(:image_3)  { create :image, category_id: category.id }
  let(:image_4)  { create :image, category_id: category.id }
  let(:image_5)  { create :image, category_id: category.id }
  let(:image_6)  { create :image, category_id: category.id }

  before :each do
    sign_in user
    image_1.reload
    image_2.reload
    image_3.reload
    image_4.reload
    image_5.reload
    image_6.reload
  end

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      get :index, params: {}
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category as @category' do
      get :show, params: {id: category.to_param}
      expect(assigns(:category)).to eq(category)
      expect(assigns(:images).count).to eq 5
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:category) }
      it 'creates a new category' do
        expect { post :create, params: { category: valid_attributes } }.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to category_path(Category.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:invalid_category) }
      it 'assigns a newly created but unsaved category as @category' do
        post :create, params: { category: invalid_attributes }
        expect(assigns(:category)).to be_a_new(Category)
      end

      it 're-renders the categories/index template' do
        post :create, params: { category: invalid_attributes }
        expect(response).to redirect_to categories_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the category' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end

    it 'redirects to the category list' do
      delete :destroy, params: {id: category.id}
      expect(response).to redirect_to categories_path
    end
  end
end
