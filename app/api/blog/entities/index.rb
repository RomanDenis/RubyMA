module Blog
  module Entities
    class Index < Grape::Entity
      expose :id

      expose :author_name do |post|
        post.user.first_name
      end

      expose :published_at, as: :published
      expose :body, as: :description
      expose :title
      expose :images, using: Blog::Entities::Image do |post|
        post.user.images
      end
    end
  end
end
