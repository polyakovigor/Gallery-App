class PictureUploader < CarrierWave::Uploader::Base

  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  storage :file

  version :standard do
    process resize_to_fill: [780, 780]
  end

  version :thumbnail do
    process resize_to_fit: [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
