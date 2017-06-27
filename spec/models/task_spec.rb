require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password', username: 'user123')
    @list = @user.lists.create(title: 'sample list')
    @task = @list.tasks.create(content: 'something something task')
  end

  it "belongs to list" do
    expect(@task.user).to eq(@user)
  end

end
