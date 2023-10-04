# frozen_string_literal: true

module ApplicationHelper
  def follow_requests
    current_user.follow_requests.includes(followable: { avatar_attachment: :blob })
  end

  def active_link_to(text = nil, path = nil, **options, &)
    link = block_given? ? text : path

    options[:class] = class_names(options[:class], 'bg-gray-900 text-white') if current_page?(link)

    if block_given?
      link_to(link, options, &)
    else
      link_to text, path, options
    end
  end
end
