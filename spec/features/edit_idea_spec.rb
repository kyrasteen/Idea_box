require 'rails_helper'

describe "Edit Idea" do
  it "updates a idea" do
    idea = Idea.create(title:"good idea", body: "allways", quality:0)
    visit edit_idea_path(idea.id)
    fill_in("idea[title]", with: "great idea")
    fill_in("idea[body]", with: "consistently")
    fill_in("idea[quality]", with: 1)
    click_link_or_button("submit")
    expect(page).to have_content("great idea")
    expect(page).not_to have_content("good idea")
  end
end
