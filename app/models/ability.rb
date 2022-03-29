class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.client?
      can :manage, TaskTodo, user_id: user.id
      can :manage, SubTask, task_todo_id: user.task_todos.pluck(:id).uniq
    elsif user.admin?
      can :read, :all
    end
  end
end