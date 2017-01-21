task :default => [:start]

task :init do
  system "bundle install --path vendor/bundle --without production"
end

task :start do
  system "bundle exec rackup -o 0.0.0.0 -p 9393"
end
