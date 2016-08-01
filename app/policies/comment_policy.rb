class CommentPolicy < ApplicationPolicy
  def create?
    user
  end

  def destroy?
    user && (user.admin? || record.user == user);
  end
end
