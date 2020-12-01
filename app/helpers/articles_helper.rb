# frozen_string_literal: true

# Article helper
module ArticlesHelper
  def article_author(article)
    user_signed_in? && current_user.id == article.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end
end
