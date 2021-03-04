class Show < ActiveRecord::Base

    def self.highest_rating
        Show.maximum("rating")
    end

    def self.most_popular_show
        num = highest_rating
        Show.find_by(rating: num)
    end

    def self.lowest_rating
        Show.minimum("rating")
    end

    def self.least_popular_show
        num = lowest_rating
        Show.find_by(rating: num)
    end

    def self.ratings_sum
        Show.sum("rating")
    end

    def self.popular_shows
        arr = []
        Show.where("rating > ?",  5).find_each do |s|
            arr << s
        end
        arr
    end

    def self.shows_by_alphabetical_order
        arr = []
        Show.order("name ASC").each do |s|
            arr << s
        end
        arr
    end
end