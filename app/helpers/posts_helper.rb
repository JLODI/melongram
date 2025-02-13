module PostsHelper

    def post_date_short(post)
        secs = (Time.now.to_i - post.created_at.to_i) 
        if secs <= 60 # minute
            return  "now"
        elsif secs <= (60 * 60) # hour
            mins = (secs / 60 ).to_i
            return "#{mins}m"
        elsif secs <= (60 * 60 * 24) # day
            hours = (secs / (60 * 60))
            return "#{hours}h"
        elsif secs <= (60 * 60 * 24 * 7) # week
            days = (secs / (60 * 60 * 24))
            return "#{days}d"
        elsif secs <= (60 * 60 * 24 * 7 * 30) # month
            weeks = (secs / (60 * 60 * 24 * 7))
            return "#{weeks}w"
        elsif secs <= (60 * 60 * 24 * 7 * 30 * 12) # year
            months = (secs / (60 * 60 * 24 * 7 * 30 ))
            return "#{months}m"
        elsif secs > (60 * 60 * 24 * 7 * 30 * 12) # year
            years = (secs / (60 * 60 * 24 * 7 * 30 * 12 ))
            return "#{years}y"
        else
            return ""
        end
    end

    def post_date_short_desc(post)
        secs = (Time.now.to_i - post.updated_at.to_i) 
        if secs <= 60 # minute
            return  "now"
        elsif secs <= (60 * 60) # hour
            mins = (secs / 60 ).to_i
            return "#{mins}m"
        elsif secs <= (60 * 60 * 24) # day
            hours = (secs / (60 * 60))
            return "#{hours}h"
        elsif secs <= (60 * 60 * 24 * 7) # week
            days = (secs / (60 * 60 * 24))
            return "#{days}d"
        elsif secs <= (60 * 60 * 24 * 7 * 30) # month
            weeks = (secs / (60 * 60 * 24 * 7))
            return "#{weeks}w"
        elsif secs <= (60 * 60 * 24 * 7 * 30 * 12) # year
            months = (secs / (60 * 60 * 24 * 7 * 30 ))
            return "#{months}m"
        elsif secs > (60 * 60 * 24 * 7 * 30 * 12) # year
            years = (secs / (60 * 60 * 24 * 7 * 30 * 12 ))
            return "#{years}y"
        else
            return ""
        end
    end

    def post_edited(post)
        if post.updated_at == post.created_at
            return " • edited"
        end
    end
    


    def post_date_long(post)
        secs = (Time.now.to_i - post.created_at.to_i) 
        if secs <= 60 # minute
            return  "now"
        elsif secs <= (60 * 60) # hour
            mins = (secs / 60 )
            return "#{mins} #{"minute".pluralize(mins)} ago"
        elsif secs <= (60 * 60 * 24) # day
            hours = (secs / (60 * 60))
            return "#{hours} #{"hour".pluralize(hours)} ago"
        elsif secs >= (60 * 60 * 24) and secs < (60 * 60 * 24 * 2) # 2 days
            return "yesterday"
        elsif secs <= (60 * 60 * 24 * 7) # week
            days = (secs / (60 * 60 * 24))
            return "#{days} #{"day".pluralize(days)} ago"
        else
            date =  post.created_at.strftime("%B %d, %Y")
            return date
        end
    end
end
