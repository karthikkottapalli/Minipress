require 'rails_helper'

describe "Modelling User Behavior On Posts resources" do
  it "visits root of the app and finds the title" do
    visit "/"
    expect(page).to have_content("Minipress")
  end
end
