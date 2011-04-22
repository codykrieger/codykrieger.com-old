Haml::Template.options[:format] = :html5

module CodykriegerCom
  module Filters
    module Markdown
      include Haml::Filters::Base
      lazy_require 'redcarpet'

      def render(text)
        md = ::Redcarpet.new text, :hard_wrap, :autolink, :fenced_code
        md.to_html
      end
    end
  end
end

