require 'rails_helper'

RSpec.describe "likes/show", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!())
    pending
  end

  it "renders attributes in <p>" do
    render
  end
end
