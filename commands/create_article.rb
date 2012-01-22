# encoding: utf-8
# Thanks denis and justin => https://gist.github.com/1103291

usage       'create_article [options] identifier'
summary     'create an article'
aliases     :ca
description <<-EOS
Create a new article in the current site. The first data source in the site
configuration will be used.
EOS

option :c, :vcs,       'specify the VCS to use',        :argument => :required
option :t, :title,     'specify the article title',     :argument => :required
option :e, :extension, 'specify the article extension', :argument => :required

run do |opts, args, cmd|
  Nanoc3::CLI::Commands::CreateArticle.call(opts, args, cmd)
end

module Nanoc3::CLI::Commands

  class CreateArticle < ::Nanoc3::CLI::Command

    def run

      # Check arguments
      if arguments.length != 1
        $stderr.puts "usage: #{command.usage}"
        exit 1
      end

      # Extract arguments and options
      identifier = arguments[0].cleaned_identifier
      identifier = '/article' + identifier unless identifier.start_with?('/article/')

      # Make sure we are in a nanoc site directory
      self.require_site

      # Set VCS if possible
      self.set_vcs(options[:vcs])

      # Check whether item is unique
      if !self.site.items.find { |i| i.identifier == identifier }.nil?
        $stderr.puts "An item already exists at #{identifier}. Please " +
                     "pick a unique name for the item you are creating."
        exit 1
      end

      # Setup notifications
      Nanoc3::NotificationCenter.on(:file_created) do |file_path|
        Nanoc3::CLI::Logger.instance.file(:high, :create, file_path)
      end

      # Figure out extension
      ext = options[:extension] || '.markdown'
      ext = '.' + ext unless ext.start_with? '.'

      # Create item
      data_source = self.site.data_sources[0]
      data_source.create_item(
        "\n",
        {
            :title      => options[:title] || arguments[0].gsub(/[_-]/, ' ').capitalize,
            :created_at => Time.now.iso8601,
            :kind       => 'article'
        },
        identifier,
        {
            :extension => ext
        }
      )

      puts "An article has been created at #{identifier}."
    end

  end

end
