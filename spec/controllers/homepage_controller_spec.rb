require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  it "index" do
    get :index
    expect(response.status).to eq(200)
  end

end
