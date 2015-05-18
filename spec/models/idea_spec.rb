require 'rails_helper'

describe Idea do
  it "has a title" do
    idea = Idea.create(title:"good idea",body: "really really good", quality:"swill" )
  end
end
