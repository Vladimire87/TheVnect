# frozen_string_literal: true

module LikesHelper
  def likes(post)
    heart =
      if post.likes.find_by(user: current_user).present?
        '<button type="button" class=" hover:bg-pink-50 hover:text-pink-300 font-medium rounded-full text-sm p-2.5 text-center inline-flex items-center">
      <svg class="w-6 h-6 fill-pink-600 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 18">
      <path d="M17.947 2.053a5.209 5.209 0 0 0-3.793-1.53A6.414 6.414 0 0 0 10 2.311 6.482 6.482 0 0 0 5.824.5a5.2 5.2 0 0 0-3.8 1.521c-1.915 1.916-2.315 5.392.625 8.333l7 7a.5.5 0 0 0 .708 0l7-7a6.6 6.6 0 0 0 2.123-4.508 5.179 5.179 0 0 0-1.533-3.793Z"/>
    </svg>
      <span class="sr-only">like</span>
    </button>'.html_safe
      else
        '<button type="button" class=" hover:bg-pink-50 hover:text-pink-300 font-medium rounded-full text-sm p-2.5 text-center inline-flex items-center">
        <svg class="w-5 h-5 text-black hover:fill-pink-600 hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 19">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"/>
        </svg>
        <span class="sr-only">like</span>
      </button>'.html_safe
      end
    heart << " #{post.likes_count}" if post.likes_count.positive?

    heart
  end
end
