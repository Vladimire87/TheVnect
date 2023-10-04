# frozen_string_literal: true

module ApplicationHelper
  def pending_requests
    current_user.pending_requests.includes(:followable)
  end
end

# user: vlad
# USE eager loading detected
#   Followability::Relationship => [:followable]
#   Add to your query: .includes([:followable])
# Call stack
#   /Users/vlad/Projects/TheVnect/app/views/friends/_pending_request_card.html.erb:5:in `block in _app_views_friends__pending_request_card_html_erb__3051409894390280214_55020'
#   /Users/vlad/Projects/TheVnect/app/views/friends/_pending_request_card.html.erb:2:in `_app_views_friends__pending_request_card_html_erb__3051409894390280214_55020'
#   /Users/vlad/Projects/TheVnect/app/views/friends/show.html.erb:4:in `_app_views_friends_show_html_erb___4019434777848760638_55000'
