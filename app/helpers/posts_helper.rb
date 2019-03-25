module PostsHelper

  def show_post_image(post)
    if post.image.attached?
      image_tag post.image.variant(resize: "200x200"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end

  def show_post_small_image(post)
    if post&.image&.attached?
      image_tag post.image.variant(resize: "200×200"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail",  width: 60
    end
  end
end
