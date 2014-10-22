# coding: utf-8

require "nokogiri"
require "uri"
require "pp"

module Url2embed
  extend self

  @@default_attr = {
    webkitallowfullscreen: "webkitallowfullscreen",
    mozallowfullscreen: "mozallowfullscreen",
    allowfullscreen: "allowfullscreen",
    frameborder: 0,
  }

  @@site_default_attr = {}
  
  def default_attr(opts=nil)
    @@default_attr.merge!(opts) if opts
    @@default_attr
  end

  def site_default_attr(site_type,opts=nil)
    hash = @@site_default_attr[site_type] || {}
    @@site_default_attr[site_type] = hash.merge(opts) if opts
    hash
  end

  def to_html(text, &block)
    text.gsub(URI.regexp) { |r|
      uri = URI.parse(r)

      site = SITE_URI_PATTERN[uri.host.to_sym]
      next r if !site

      match_result = uri.request_uri.match(site[:pattern])
      next r if !match_result
      
      f = Nokogiri::make(site[:fragment].call(match_result))
      default_attr.merge(site_default_attr(site[:type])).each { |k,v|
        f[k] = v
      }
      f = yield(f,site) if block
      f.to_s
    }
  end
end
