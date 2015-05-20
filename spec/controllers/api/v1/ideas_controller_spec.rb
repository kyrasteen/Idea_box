require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  it "index" do
    Idea.create(title:"get a job", body: "soonish", quality:1)
    get :index, format: :json
    ideas = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(ideas.first['title']).to eq("get a job")
  end

end
