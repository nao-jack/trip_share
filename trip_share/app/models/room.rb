class Room < ApplicationRecord
    validates :room_name,{presence: true}
    validates :adress,{presence: true}
    validates :price,{presence: true}
    validates :user_id,{presence: true}
    
   def user
      return User.find_by(id: self.user_id)
   end
   
    def reservation
      return Room.find_by(id: self.room_id)
    end

   
   def self.search(adress,search)
      if adress
        @rooms = Room.where(["adress LIKE ?", "%#{adress}%"])
      elsif search
        @rooms = Room.where(["adress LIKE ? OR room_name LIKE ?","%#{search}%","%#{search}%"])
      else
        @rooms = Room.all
      end
   end

end
