module QuestionsHelper

  def question_helper(question)
    if question.new_record?
      "Create new '#{question.test.title}' Question"
    else
      "Edit '#{question.test.title}' Question"
    end
  end
end