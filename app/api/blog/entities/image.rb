module Blog
  module Entities
    class Image < Grape::Entity
      expose :id
      expose :url
    end
  end
end
