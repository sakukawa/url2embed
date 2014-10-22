#!/usr/bin/env ruby

require "url2embed"

#Url2embed::default_attr({ width: 420, height: 315 })
Url2embed::site_default_attr(:youtube, { width: 420, height: 315 })
Url2embed::site_default_attr(:vimeo, { width: 400, height: 225 })

TEXT=<<EOS
  this is http://www.youtube.com/watch?v=oijewoij youtube.
  this is http://vimeo.com/jgewopj vimeo
EOS

# default
puts "="*80
puts Url2embed::to_html(TEXT)

# you can modify tag attribute.
puts "="*80
puts Url2embed::to_html(TEXT) { |fragment|
  # fragment is Nokogiri::XML::Element
  fragment[:hoge] = "foo"
  fragment
}

# delete vimeo url
puts "="*80
puts Url2embed::to_html(TEXT) { |fragment, site|
  site[:type] == :vimeo ? "" : fragment
}
