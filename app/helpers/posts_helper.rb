module PostsHelper

    def time_of_post(post)
        secs = (Time.now - post.updated_at).to_i 
            if secs <= 60
                return  "now"
            elsif secs <= 3600
                mins = (secs / 60 ).to_i
                return "#{mins}m"
            elsif secs <= 216000
                hours = (secs / 3600)
                return "#{hours}h"
            else
                return "i didnt make that value yet"
            end
    end
end
