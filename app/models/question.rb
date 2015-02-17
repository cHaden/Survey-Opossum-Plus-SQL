class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :question_text, presence: true

  accepts_nested_attributes_for :options,
      :allow_destroy => true,
      :reject_if     => :all_blank

  def self.penultimate
    self.order(created_at: :desc).limit(1).offset(1).all
  end

  def self.time_by_type
    self.select("question_type, max(created_at) AS max_time").group(:question_type).order("max(created_at) DESC").all
  end

  # -- Find the number (count) of each type of question in the database
  def self.count_of_each_question_type
    self.select("question_type").group(:question_type).count
  end



end
