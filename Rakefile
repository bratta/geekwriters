desc "Create a new post"
task :newpost do
  require 'rubygems'
  require 'highline/import'

  title = ask("Post title: ") { |q| q.echo = true }
  author = ask("Author name: ") { |q| q.echo = true }
  sanitized_title = title.downcase.gsub(/\s+/, '-').gsub(/[^\w\-]+/, '')
  filename = "#{File.dirname(__FILE__)}/_posts/#{Time.now.localtime.strftime('%Y-%m-%d')}-#{sanitized_title}.markdown"
  if !File.exist?(filename)
    contents = "---\nlayout: post\ntitle: #{title}\nauthor: #{author}\ncomments: true\n---\n"
    File.open(filename, 'w') do |f|
      f.write contents
    end
  end
  `$EDITOR #{filename}`
end