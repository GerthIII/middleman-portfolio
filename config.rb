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
end

require 'yaml'

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
