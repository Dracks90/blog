class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user && user.admin?
  end

  def new?
    user && user.admin?
  end

  def update?
    user && user.admin?
  end

  def edit?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end
end