class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fill: [800, 800]
  end

  version :thumbnail do
    process resize_to_fill: [200, 200]
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
