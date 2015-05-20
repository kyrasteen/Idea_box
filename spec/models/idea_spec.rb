require 'rails_helper'

describe Idea do
  context "is valid" do
    it "has correct attributes" do
      idea = Idea.create(title:"good idea",body: "really really good", quality:"swill")
      expect(idea.title).to eq("good idea")
      expect(idea.body).to eq("really really good")
      expect(idea.quality).to eq("swill")
    end

    it "has a default value of zero for quality" do
      idea = Idea.create(title:"good idea",body: "really really good")
      expect(idea.quality).to eq("swill")
    end
  end

  context "is invalid" do
    it "missing any attribute" do
      idea = Idea.create(title:"", body: "really really good", quality:"swill")
      expect(idea).not_to be_valid
    end
  end
end
