require 'rails_helper'

RSpec.describe List, type: :model do
  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password', username: 'user123')
    @list = @user.lists.create(title: 'sample list')
    @task = @list.tasks.create(content: 'something something task')
  end

  it "belongs to user" do
    expect(@list.user).to eq(@user)
  end

  it "has many tasks" do
    expect(@list.tasks.size).to eq(1)
  end

end
