module CommentsHelper
    def comment_date_short(comment)
        secs = (Time.now.to_i - comment.updated_at.to_i) 
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
    
    def comment_edited(comment)
        if comment.updated_at > (comment.created_at + 5.seconds)
            return "edited • "
        end
    end
end
