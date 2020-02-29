module ApplicationHelper

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}"
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :class => "alert alert-primary #{key}", :role => 'alert'
    end.join.html_safe
  end
  
end
