class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  devise :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :trackable, :confirmable
  default_scope :conditions => { :deleted_at => nil }
  validates_presence_of     :name, :email
  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :on => :create
  validates_length_of       :password, :within => 6..30, :allow_blank => true
  validates_uniqueness_of   :email, :case_sensitive => false, :scope => :deleted_at
  validates_format_of       :email, :with => Devise::email_regexp

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  
  def role?(role)
    return !!self.roles.find_by_name( Role.sanitize role )
  end

def destroy
    self.update_attribute(:deleted_at, Time.now.utc)
  end

  def self.find_with_destroyed *args
    self.with_exclusive_scope { find(*args) }
  end

  def self.find_only_destroyed
    self.with_exclusive_scope :find => { :conditions => "deleted_at IS NOT NULL" } do
      all
    end
  end

end
