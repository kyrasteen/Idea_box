require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  it "index" do
    get :index, format: :json
    expect(response.status).to eq(200)
  end

end
