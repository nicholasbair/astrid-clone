class UserPolicy < ApplicationPolicy
  def index?
    record == user
  end

  def show?
    record == user
  end

  def new?
    record == user
  end

  def create?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
