class AverageMarkCalculator
  attr_reader :mark, :action, :average_mark

  def initialize(mark, action)
    @mark         = mark
    @action       = action
    @average_mark = AverageMark.find_or_create_by(:student_id => mark.student_id, :semester_id => mark.semester_id)
  end

  def set_mark_value
    average_mark.update_attributes(:value => new_value, :subject_count => new_subject_count)
  end

  private

  def new_value
    @new_value ||= case action
                   when :increase
                     (current_value + mark.value) / new_subject_count
                   when :decrease
                     if new_subject_count.zero?
                       0
                     else
                       (current_value - mark.value) / new_subject_count
                     end
                   end
  end

  def new_subject_count
    @new_subject_count ||= case action
                           when :increase
                             average_mark.subject_count + 1
                           when :decrease
                             average_mark.subject_count - 1
                           end
  end

  def current_value
    @current_value ||= (average_mark.value.to_f * average_mark.subject_count).round.to_f
  end
end
