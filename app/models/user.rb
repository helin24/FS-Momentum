class User < ActiveRecord::Base
  attr_reader :entered_password
  has_many :skills, through: :skills_users
  has_many :notes
  has_many :skills_users
  has_many :photos

  validates :email, :password, presence: true

  def select(col_name)
    case col_name
    when 'name'
      name
    when 'email'
      email
    when 'about'
      about
    when 'birthday'
      birthday
    end
  end

  def edit_value(col_name, new_val)
    case col_name
    when 'name'
      self.name = new_val
    when 'email'
      self.email = new_val
    when 'about'
      self.about = new_val
    when 'birthday'
      self.birthday = new_val
    end
    self.save
  end

  include BCrypt

  def password
    @password ||= Password.new(self.password_hash) #password in database
  end

  def password=(text_pw)
    @entered_password = text_pw
    @password = BCrypt::Password.create(text_pw)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      user
    elsif user
      "Password incorrect!"
    else
      "This user does not exist!"
    end
  end

  def add_skills
    self.skills << Skill.all
  end
end
