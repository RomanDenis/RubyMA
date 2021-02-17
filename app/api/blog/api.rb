module Blog
  class API < Grape::API
    mount Blog::V1::Posts
  end
end