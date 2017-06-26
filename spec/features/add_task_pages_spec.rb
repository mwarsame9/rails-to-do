require 'rails_helper'

describe "the add a task process" do
  it "adds a task to a list" do
    list = List.create(:name => 'Home stuff')
    visit lists_path(list)
    click_link 'Home stuff'
    click_link 'Add a task'
    fill_in 'Description', :with => 'Wash the dishes'
    click_on 'Create Task'
    expect(page).to have_content 'Wash the dishes'
  end

  it "gives error when no name is entered" do
    list = List.create(:name => 'Home stuff')
    visit lists_path(list)
    click_link 'Home stuff'
    click_link 'Add a task'
    click_on 'Create Task'
    expect(page).to have_content 'errors'
  end
end
