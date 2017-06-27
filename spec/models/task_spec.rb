require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    @user = create(:user)
    @list = @user.lists.create(title: 'sample list')
    @task = @list.tasks.create(content: 'something something task')
  end

  context 'associations' do

    it "belongs to list" do
      expect(@task.list).to eq(@list)
    end

    it "belongs to user" do
      expect(@task.user).to eq(@user)
    end
  
  end

  it "defaults to incomplete" do
    expect(@task.incomplete?).to eq(true)
  end

  it "can be complete" do
    @task.status = "complete"
    expect(@task.complete?).to eq(true)
  end

  it "has content" do
    expect(@task.content).to eq("something something task")
  end

end
