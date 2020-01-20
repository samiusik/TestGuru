module ApplicationHelper

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}"
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :class => "flash #{key}"
    end.join.html_safe
  end
  
end
