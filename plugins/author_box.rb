require 'digest/md5'
module Jekyll
  require_relative 'post_filters'
  class AuthorBox < PostFilter

    def post_render(post)
      if post.is_post?
        authors = YAML::load(File.open(File.expand_path('../../author.yml', __FILE__)))
        author = authors[post.data["author"]]
        post.content << render_content(author) if author
      end
    end

    def render_content(author)
      @template = Liquid::Template.parse(File.read(File.expand_path('../../source/_includes/post/author.html', __FILE__)))
      @template.render(
        'author' => author,
        'gravatar' => author['gravatar'] || get_gravatar(author['email'])
      )
    end

    def get_gravatar(email)
      hash = Digest::MD5.hexdigest(email.downcase)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end

end
