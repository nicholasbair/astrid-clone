require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password', username: 'user123')
  end

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
