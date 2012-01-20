# https://github.com/chriseppstein/chriseppstein.github.com/blob/source/Rakefile
desc "deploy website"
task :deploy do
  system "nanoc co"
  require "git"
  repo = Git.open('.')
  repo.branch("master").checkout
  (Dir["*"] - ["output"]).each { |f| rm_rf(f) }
  Dir["output/*"].each { |f| mv(f, ".") }
  rm_rf("output")
  Dir["**/*"].each { |f| repo.add(f) }
  repo.status.deleted.each { |f,s| repo.remove(f) }
  message = ENV["MESSAGE"] || "site updated"
  repo.commit(message)
  repo.branch("source").checkout
  system "git push origin master"
end
