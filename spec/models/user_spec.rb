require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  context 'associations' do

    it "has many lists" do
      @user.lists.create
      expect(@user.lists.count).to eq(1)
    end

    it "has many tasks" do
      @list = @user.lists.create(title: 'sample list')
      @list.tasks.create(content: 'something something task')
      expect(@user.lists.count).to eq(1)
      expect(@user.lists.last.tasks.count).to eq(1)
    end

  end

  context 'validations' do

    it "username is unique" do
      expect{ create(:user) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "email is unique" do
      expect{ create(:user) }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  context 'class methods' do

    it ".most_completed_tasks returns the user with most completed tasks" do
      @list = @user.lists.create(title: 'sample list')
      @list.tasks.create(content: 'something something task')
      @list.tasks.create(content: 'another task')
      @list.tasks.each { |task| task.status = "complete"; task.save }

      @user2 = User.create(:username => "bob", :email => "bob@bob.bob", :password => "password")
      @list2 = @user2.lists.create(title: 'sample list')
      @list2.tasks.create(content: 'something something task')
      @list2.tasks.create(content: 'another task')

      expect(User.most_completed_tasks).to be([{ :user => @user, :quanity => 1 }])
    end

  end

  it "has an email" do
    expect(@user.email).to be_truthy
  end

  it "has a username" do
    expect(@user.username).to be_truthy
  end

  it "responds to #complete" do
    @list = @user.lists.create(title: 'sample list')
    @list.tasks.create(content: 'something something task', status: 'complete')
    expect(@user.tasks.complete.count).to eq(1)
  end

  it "responds to #incomplete" do
    @list = @user.lists.create(title: 'sample list')
    @list.tasks.create(content: 'something something task')
    expect(@user.tasks.incomplete.count).to eq(1)
  end

end
