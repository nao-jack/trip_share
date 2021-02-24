class Reservation < ApplicationRecord
    validates :start_date,{presence: true}
    validates :end_date,{presence: true}
    validates :user_id,{presence: true}
    validates :room_id,{presence: true}
    validates :total_price,{presence: true}
    validates :group,{presence: true}
    
    def user
      return User.find_by(id: self.user_id)
    end
    
    def room
        return Room.find_by(id: self.room_id)
    end
   
end
