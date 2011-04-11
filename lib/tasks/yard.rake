YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', 'app/**/*.rb', '-', 'README.md']
  t.options = %w(--title Codykrieger.com)
end
