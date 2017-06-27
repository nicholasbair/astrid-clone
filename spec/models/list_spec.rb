require 'rails_helper'

RSpec.describe List, type: :model do
  before(:each) do
    @user = create(:user)
    @list = @user.lists.create(title: 'sample list')
    @task = @list.tasks.create(content: 'something something task')
  end

  it "belongs to user" do
    expect(@list.user).to eq(@user)
  end

  it "has many tasks" do
    expect(@list.tasks.size).to eq(1)
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

end
