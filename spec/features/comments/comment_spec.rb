require 'rails_helper'

describe "Modelling User Behavior on Comments resources" do
  it "Create a comment on the post page" do
    @post = Post.new(headline: "Obama wins the election", summary: "On 2008, May 16th, Obama won the election....")
    @post.save
    visit post_path(@post)

    fill_in 'Content', with: "Looks like I lost the election. Too bad! All the best Obama!"
    fill_in 'Username', with: "John McCain"
    click_button "Create Comment"
    visit post_path(@post)

    expect(page).to have_content("John McCain")
  end

  it "Should not be able to save a blank comment" do
    expect(Comment.count).to eq(0)
    @comment = Comment.new(content: "", username: "John McCain")
    @comment.save
    expect(Comment.count).to eq(0)    
  end

  it "Should not be able to save a blank username" do
    expect(Comment.count).to eq(0)
    @comment = Comment.new(content: "Oh damn! I lost the election", username: "")
    @comment.save
    expect(Comment.count).to eq(0)  
  end
end