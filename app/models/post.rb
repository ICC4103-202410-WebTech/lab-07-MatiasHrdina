class Post < ApplicationRecord
    belongs_to :user 
    has_many :post_tags
    has_many :tags, through: :post_tags
    has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"
    belongs_to :parent_post, class_name: "Post", optional: true
    
    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count must be equal or greater than 0" }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count must be equal or greater than 0" }
    before_validation :set_time_now_publish_date
  
    private
  
    def set_time_now_publish_date
      self.published_at ||= Time.zone.now
    end
  end