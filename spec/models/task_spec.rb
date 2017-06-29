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

  context 'validations' do

    it "must have content" do
      @task2 = Task.new
      @task2.save
      expect(@task2.errors.size).to eq(1)
    end

    it "content is unique in the scope of the parent list" do
      @task2 = @list.tasks.build(content: 'something something task')
      @task2.save
      expect(@task2.errors.size).to eq(1)
    end

    it "must have a list_id" do
      @task2 = Task.new
      @task2.content = "important task"
      @task2.save
      expect(@task2.errors.size).to eq(1)
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
