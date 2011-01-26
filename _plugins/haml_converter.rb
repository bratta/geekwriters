module Jekyll
  require 'haml'
  require 'sass'
  
  class HamlConverter < Converter
    safe true
    priority :low
    
    def matches(ext)
      ext =~ /haml/i
    end
    
    def output_ext(ext)
      ".html"
    end
    
    def convert(content)
      engine = Haml::Engine.new(content)
      engine.render
    end
  end
  
  class ScssConverter < Converter
    safe true
    priority :low
    
    def matches(ext)
      ext =~ /scss/i
    end
    
    def output_ext(ext)
      ".css"
    end
    
    def convert(content)
      engine = Sass::Engine.new(content, :syntax => :scss, :style => :compressed)
      engine.render
    end
  end
  
  class SassConverter < Converter
    safe true
    priority :low
    
    def matches(ext)
      ext =~ /sass/i
    end
    
    def output_ext(ext)
      ".css"
    end
    
    def convert(content)
      engine = Sass::Engine.new(content, :style => :compressed)
      engine.render
    end
  end  
end