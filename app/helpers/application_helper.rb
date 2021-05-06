module ApplicationHelper
  def default_meta_tags
    {
      site: 'Buildesk（ビルデスク）',
      reverse: true,
      separator: '|',
      og: default_og,
      twitter: default_twitter_card,
      icon: [
        { href: image_url('buidesk_favicon.png') }
      ]
    }
  end

  private

  def default_og
    {
      site_name: :site,
      title: :title,
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
