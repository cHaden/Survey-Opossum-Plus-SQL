class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission


  # -- Find the most common answer to a particular question (given a question_id)
  def self.most_common
    self.where(question_id: 42).limit(1).all
  end

end
