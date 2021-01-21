class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{due_date.to_s(:long)} #{todo_text} "
  end
end
