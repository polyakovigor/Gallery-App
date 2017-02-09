require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create :category }
  let(:image_1)  { create :image, category_id: category.id }
  let(:image_2)  { create :image, category_id: category.id }

  before :each do
    image_1.reload
    image_2.reload
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
      expect(assigns(:category).images.count).to eq 2
    end
  end
end
