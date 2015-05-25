require 'rails_helper'

describe "Modelling User Behavior On Posts resources" do
  it "visits root of the app and finds the title" do
    visit "/"
    expect(page).to have_content("Minipress")
  end


  it "Create a new post" do
    visit "/posts/new"
    expect(page).to have_content("New Post")

    fill_in 'Headline', with: "John Nash dies in a car accident"
    fill_in 'Summary', with: "Today morning in New Jersey, John Nash of the beautiful mind fame ..."
    click_button "Create Post"

    visit "/"
    expect(page).to have_content("John Nash dies in a car accident")
  end

  it "Find a list of posts on the homepage" do
    @post1 = Post.new(headline: "Obama wins the election1", summary: "On 2008, May 16th, Obama won the election....")
    @post2 = Post.new(headline: "Obama wins the election2", summary: "On 2012, May 16th, Obama won the election....")
    @post3 = Post.new(headline: "Obama wins the election3", summary: "On 2014, May 16th, Obama won the election....")

    @post1.save
    @post2.save
    @post3.save

    visit "/"
    expect(page).to have_content("Obama wins the election1")
    expect(page).to have_content("Obama wins the election2")
    expect(page).to have_content("Obama wins the election3") 
  end

  it "Reach the individual post" do
      @post = Post.new(headline: "Obama wins the election", summary: "On 2008, May 16th, Obama won the election....")
      @post.save
      visit post_path(@post)
      expect(page).to have_content("On 2008, May 16th, Obama won the election....")
      expect(page).to have_content("Comments:")
  end

  it "Be able to delete a post" do
      @post = Post.new(headline: "Obama wins the election", summary: "On 2008, May 16th, Obama won the election....")
      @post.save
      visit post_path(@post)
      click_link "Delete Post"
      expect(page).to_not have_content("Obama wins the election")
  end

  it "Should not be able to save a post with an empty headline" do 
      expect(Post.count).to eq(0)
      @post = Post.new
      @post.save
      expect(Post.count).to eq(0)    
  end
end