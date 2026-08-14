require "jekyll"

# Generates an English detail page (/en/blog/...) for every post that has
# English content (title_en / content_en). This mirrors the site's bilingual
# pattern (list pages are bilingual; now detail pages are too) without
# duplicating the 87 post source files — the post itself stays the single
# source of truth and this plugin emits the EN variant at build time.
#
# The generated page reuses the existing `post.html` layout, which already
# renders English when `page.lang == 'en'` (title_en / content_en | markdownify).
module Jekyll
  class EnPostGenerator < Generator
    safe true
    priority :low

    def generate(site)
      return if site.config['en_posts_enabled'] == false

      site.posts.docs.each do |post|
        next unless post.data['content_en'] || post.data['title_en']

        site.pages << EnPostPage.new(site, post)
      end
    end
  end

  class EnPostPage < Page
    def initialize(site, post)
      @site = site
      @base = site.source
      @dir  = ''
      # Document has no `.name`; build a unique filename from basename+ext.
      @name = post.basename + post.ext
      @data = {}
      @content = post.content.to_s

      self.process(@name)

      # Copy the post's front matter so post.html has everything it needs
      # (date, tags, author, title_en, content_en, description_en, ...).
      post.data.each { |k, v| @data[k] = v }

      # Force English rendering + EN permalink.
      @data['lang']      = 'en'
      @data['layout']    = 'post'
      @data['permalink'] = post.url.sub('/blog/', '/en/blog/')

      # Fix relative image paths in content_en so they resolve correctly
      # under /en/blog/2026/slug/ instead of /en/blog/2026/assets/img/...
      if @data['content_en']
        @data['content_en'] = fix_image_paths(@data['content_en'])
      end
    end

    # Rewrite relative image src paths to absolute (prepend /).
    # Handles: ![alt](path), <img src="path">
    def fix_image_paths(content)
      # Markdown images: ![alt](relative/path.ext)
      content = content.gsub(/!\[([^\]]*)\]\(([^)]+\.(jpg|jpeg|png|gif|svg|webp))\)/i) do
        alt = Regexp.last_match[1]
        src = Regexp.last_match[2]
        "![#{alt}](#{absolute_path(src)})"
      end
      # HTML img tags with relative src
      content = content.gsub(/<img\s[^>]*src="([^"]+\.(jpg|jpeg|png|gif|svg|webp))"[^>]*>/i) do
        match = Regexp.last_match[0]
        src = Regexp.last_match[1]
        match.sub(src, absolute_path(src))
      end
      content
    end

    def absolute_path(path)
      return path if path.start_with?('/') || path.start_with?('http://') || path.start_with?('https://') || path.start_with?('{{')
      '/' + path
    end

    # We build the page from the post's data in memory; do not read a file.
    def read_yaml(*_); end
  end
end
