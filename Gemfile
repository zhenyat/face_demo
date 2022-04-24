source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem 'seed_dump'                                 # https://github.com/rroblak/seed_dump
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"

# gem 'face', :github => 'zhenyat/face.git', :branch => 'master'
gem 'face', path: '~/ZT_Lab/Ruby/Gems/face'

gem 'simple_form'                               # https://github.com/plataformatec/simple_form
gem 'enum_help'

# gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# gem "sassc-rails"
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"

  # gem "rack-mini-profiler"
  # gem "spring"
end
