class Todo < ActiveRecord::Base

  def self.overdue
    all.where("due_date < :date", { date: Date.today })
  end

  def self.due_today
    all.where(due_date: Date.today)
  end

  def self.due_later
    all.where("due_date > :date", { date: Date.today })
  end

  def self.completed
    all.where(completed: true)
  end

  def self.is_not_completed
    all.where(completed: false)
  end
end
