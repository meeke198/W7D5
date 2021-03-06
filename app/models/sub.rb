# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true
    belongs_to :user,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User 

    
end
