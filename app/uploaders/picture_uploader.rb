class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def set_original_filename
    original_filename
  end

  version :thumb do
     process resize_to_fill: [200, 200]
  end

  version :large do
     process resize_to_limit: [800, 800]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
