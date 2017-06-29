require 'rails_helper'

RSpec.describe List, type: :model do
  before(:each) do
    @user = create(:user)
    @list = @user.lists.create(title: 'sample list')
    @task = @list.tasks.create(content: 'something something task')
  end

  context 'associations' do

    it "belongs to user" do
      expect(@list.user).to eq(@user)
    end

    it "has many tasks" do
      expect(@list.tasks.size).to eq(1)
    end

  end

  context 'validations' do

    it "must have a title" do
      @list2 = List.new
      @list2.save
      expect(@list2.errors.size).to eq(1)
    end

    it "title is unique in the scope of the parent user" do
      @list2 = @user.lists.build(title: 'sample list')
      @list2.save
      expect(@list2.errors.size).to eq(1)
    end

    it "must have a user_id" do
      @list2 = List.new
      @list2.title = "An title"
      @list2.save
      expect(@list2.errors.size).to eq(1)
    end

  end

  it "defaults to incomplete" do
    expect(create(:list).incomplete?).to eq(true)
  end

  it "can be complete" do
    expect(create(:completed_list).complete?).to eq(true)
  end

  it "has a title" do
    expect(@list.title).to eq("sample list")
  end

  it "responds to #complete" do
    @list = create(:list)
    @list.tasks.create(content: 'something something task', status: 'complete')
    expect(@list.tasks.complete.count).to eq(1)
  end

  it "responds to #incomplete" do
    @list = create(:list)
    @list.tasks.create(content: 'something something task')
    expect(@list.tasks.incomplete.count).to eq(1)
  end

end
