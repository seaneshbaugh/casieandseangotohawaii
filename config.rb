# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# activate :autoprefixer do |prefix|
#   prefix.browsers = "last 2 versions"
# end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

trips = %w[2017 2021]

trips.each do |trip|
  proxy(
    "/#{trip}.html",
    '/show.html',
    locals: {
      trip: trip
    },
    ignore: true
  )
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

activate :external_pipeline,
  name: :webpack,
  command: build? ?
  './node_modules/webpack/bin/webpack.js --bail --mode=production' :
  './node_modules/webpack/bin/webpack.js --watch --progress --color --mode=development --stats-children --stats-error-details',
  source: 'dist',
  latency: 1

set :haml, { attr_wrapper: '"' }
