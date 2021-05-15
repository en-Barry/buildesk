module ApplicationHelper
  require "uri"

  def default_meta_tags
    {
      site: 'Buildesk（ビルデスク）',
      reverse: true,
      separator: '|',
      og: default_og,
      twitter: default_twitter_card,
      icon: [
        { href: image_url('buildesk_favicon.png') }
      ]
    }
  end

  # アイテムURLを自動的にハイパーリンク化
  def text_url_to_link(text)
    URI.extract(text, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      text.gsub!(url, sub_text)
    end
    text
  end

  # アクティブ化を判断
  def active_if(path)
    path == controller_path ? 'active' : ''
  end

  private

  def default_og
    {
      site_name: :site,
      title: :og_title,
      description: :description,
      url: request.url,
      image: image_url('app_ogp.png')
    }
  end

  def default_twitter_card
    {
      card: 'summary_large_image'
    }
  end
end
