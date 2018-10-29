class User < ApplicationRecord
  validates :name, presence:true,uniqueness: true, length: {minimum: 2,maximum: 20}
  validates :introduction, length: {maximum: 50}
  #validates :introduction,length: {minimum: 3 ,maximum: 50}

  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy


end
