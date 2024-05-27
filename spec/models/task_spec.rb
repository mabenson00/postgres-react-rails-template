# frozen_string_literal: true

RSpec.describe Task do
  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end

  it "can create a completed task" do
    task = create(:task, completed: true)
    expect(task.completed).to be true
  end
end
