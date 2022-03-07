## A simple way to inspect liquid template variables.
## Usage:
##  Can be used anywhere liquid syntax is parsed (templates, includes, posts/pages)
##  {{ site | debug }}
##  {{ site.posts | debug }}
##
#require 'pp'
#module Jekyll
#  # Need to overwrite the inspect method here because the original
#  # uses < > to encapsulate the psuedo post/page objects in which case
#  # the output is taken for HTML tags and hidden from view.
#  #
#  class Post
#    def inspect
#      "#Jekyll:Post @id=#{self.id.inspect}"
#    end
#  end
#  
#  class Page
#    def inspect
#      "#Jekyll:Page @name=#{self.name.inspect}"
#    end
#  end
#  
#end # Jekyll
#  
#module Jekyll
#  module DebugFilter
#    
#    def debug(obj, stdout=true)
#      puts "#{obj.pretty_inspect}"
#    end
#
#  end # DebugFilter
#end # Jekyll

#Liquid::Template.register_filter(Jekyll::DebugFilter)

#Jekyll::Hooks.register :pages, :post_render do |page|
#  Jekyll.logger.error "Initialized:",
#    "Hooked Excerpt for #{page}".green if page.basename == "about"
#end

class Jekyll::Converters::Markdown::MyCustomProcessor
  def initialize(config)
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install funky_markdown'
    raise FatalException.new("Missing dependency: funky_markdown")
  end

  def convert(content)
    if content.include? "May 2021"
      puts content
    end
    content
  end
end
