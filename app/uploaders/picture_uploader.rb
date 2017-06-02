class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def cache_dir
    "/tmp/uploads"
  end

  def store_dir
    # "db/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    nil
  end

  version :thumb do
     process resize_to_fill: [200, 200]
  end

  version :large do
     process resize_to_fit: [780, 780]
     process resize_to_fill: [780, 780]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
