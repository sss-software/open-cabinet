class Tester
  include ActiveModel::Model

  def self.return_100
    100
  end

  def self.return_hello
    'hello'
  end

  def self.return_goodbye
    'goodbye'
  end
end
