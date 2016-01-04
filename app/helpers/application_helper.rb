module ApplicationHelper
  def show_yes_or_no(boolean_value)
    boolean_value ? 'Sim' : 'Não'
  end

  def department_options
    (Department.all.map do |department|
      [department.code, department.id]
    end).unshift ["", ""]
  end
end
