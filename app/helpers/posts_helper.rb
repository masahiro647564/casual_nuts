module PostsHelper

  def show_post_image(post)
    if post.image.attached?
      image_tag post.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end

  def show_post_small_image(post)
    if post&.image&.attached?
      image_tag post.image.variant(resize: "100×100"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail",  width: 50
    end
  end
end
