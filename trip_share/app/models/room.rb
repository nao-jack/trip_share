class Room < ApplicationRecord
    validates :room_name,{presence: true}
    validates :adress,{presence: true}
    validates :price,{presence: true}
   
   def user
      return User.find_by(id: self.user_id)
   end
   
   def self.search(adress,search)
      if  search
        @rooms = Room.where(["adress LIKE ? OR room_name LIKE ? OR name LIKE ?","%#{search}%","%#{search}%","%#{search}%"])
      else
        @rooms = Room.all
      end
   end

end
