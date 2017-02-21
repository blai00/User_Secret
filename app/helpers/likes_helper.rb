module LikesHelper
    def find_id (likes, user_id)
       likes.find {|like| like.user_id == user_id}.id
    end
        
end