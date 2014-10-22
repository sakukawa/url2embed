# Url2embed

convert text url to embeddable html.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'url2embed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url2embed

## Usage

### Basic

```ruby
TEXT=<<EOS
  this is http://www.youtube.com/watch?v=YOUTUBEID youtube.
  this is http://vimeo.com/VIMEOID vimeo
EOS

puts Url2embed::to_html(TEXT)
```

```
this is <iframe src="//www.youtube.com/embed/YOUTUBEID?rel=0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen" frameborder="0" width="420" height="315"></iframe> youtube.
this is <iframe src="//player.vimeo.com/video/VIMEOID" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen" frameborder="0" width="400" height="225"></iframe> vimeo
```

### Customize Attributes

```ruby
puts Url2embed::to_html(TEXT) { |fragment|
	# fragment is Nokogiri::XML::Element
	fragment[:hoge] = "foo"
	fragment
}
```

```
this is <iframe src="//www.youtube.com/embed/YOUTUBEID?rel=0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen" frameborder="0" width="420" height="315" hoge="foo"></iframe> youtube.
this is <iframe src="//player.vimeo.com/video/VIMEOID" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen" frameborder="0" width="400" height="225" hoge="foo"></iframe> vimeo
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/url2embed/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
