class Todo < ApplicationRecord
  validates :title, presence: true
  has_many :comments

  after_create_commit -> { broadcast_prepend_to "todos" }
  after_update_commit -> { broadcast_replace_to "todos" }
  after_destroy_commit -> { broadcast_remove_to "todos" }


#   after_create_commit -> { broadcast_prepend_to "todos", partial: "todos/todo", locals: { todo: self }, target: "todos" }
#   after_destroy_commit {
#   broadcast_remove_to "todos"
#   }
#   after_update_commit {
#   # target here is the ID of each of the creature div
#   broadcast_replace_to "todos", target: "todo_#{id}", partial: "todos/todo", locals: {todo: self}
# }


end
