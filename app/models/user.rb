# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :integer          not null
#  session_token   :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    has_many :posts,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :Post 

    has_many :subs,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Sub 


end
