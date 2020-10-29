class Post < ApplicationRecord

  validates :description, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: {
    medium: "480x270#", small: "320x180#", thumb: "160x90#"
  },
  source_file_options: { regular: "-density 96 -depth 8 -quality 86" },
  default_url: "/system/image_missing/missing.png", validate_media_type: false

  validates_attachment_content_type :image, :content_type  => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

 

end
