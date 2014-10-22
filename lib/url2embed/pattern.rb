module Url2embed
  SITE_URI_PATTERN = {
                      :"youtu.be" => {
                        type: :youtube,
                        pattern: /\/(.+?)$/i,
                        fragment: lambda { |r|
                          %Q{<iframe src="//www.youtube.com/embed/#{r[1]}?rel=0"></iframe>}
                        },
                      },
                      :"youtube.com" => {
                        type: :youtube,
                        pattern: /(?:\/watch\?v=|youtu.be\/)(.+?)$/i,
                        fragment: lambda { |r|
                          %Q{<iframe src="//www.youtube.com/embed/#{r[1]}?rel=0"></iframe>}
                        },
                      },
                      :"vimeo.com" => {
                        type: :vimeo,
                        pattern: /\/(.+?)$/i,
                        fragment: lambda { |r|
                          %Q{<iframe src="//player.vimeo.com/video/#{r[1]}"></iframe>}
                        },
                      }
  }
  SITE_URI_PATTERN[:"www.youtube.com"] = SITE_URI_PATTERN[:"youtube.com"]
end
