class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  def self.names_with_titles
    Author.joins(:surveys).all
  end

  # -- Find all authors with an email address of "shakespeare@example.com"
  def self.email_shakespeare
    self.where(email: "shakespeare@example.com").all
  end

  # -- Find the author who was created most recently
  def self.most_recent
    self.order(created_at: :desc).limit(1).all
  end

  # -- Find all survey names, and show their author's email addresses with them
  def self.names_and_emails
    Author.joins(:surveys).where(id: surveys.author_id).all
  end


  # -- Find all authors who have never created a survey
  def self.non_prolific_authors
    Author.joins(:surveys).where(id: surveys.author_id).where(surveys.id: nil).all
  end

end
