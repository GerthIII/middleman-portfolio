# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

helpers do
  def project_slug(project)
    project.name.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9-]/, '')
  end

  def feature_media(feature)
    if feature.image.to_s.match?(/\.(mp4|webm)\z/i)
      ext = File.extname(feature.image).delete('.').downcase
      source = tag(:source, src: image_path(feature.image), type: "video/#{ext}")
      content_tag(:video, source,
                  autoplay: true, muted: true, loop: true, playsinline: true,
                  preload: 'metadata',
                  poster: (feature.poster ? image_path(feature.poster) : nil),
                  'aria-label': feature.title)
    else
      image_tag(feature.image, alt: feature.title)
    end
  end
end

require 'yaml'

# Partials are includes, not pages — don't build them as standalone HTML.
ignore 'partials/*'

YAML.load_file(File.expand_path('data/projects.yml', __dir__)).each do |p|
  slug = p['name'].downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9-]/, '')
  proxy "/projects/#{slug}.html",
        "/project_template.html",
        locals: { slug: slug },
        ignore: true
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
