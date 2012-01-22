class Smusher < Nanoc3::Filter
  
  
  identifier :smusher
  type       :binary
  
  # "output_finename"
  
  def run(filename, params={})
    system(
      'smusher',
      filename
    )
  end
  
  # didn't work too
  
  # def run(content, params={})
  #   ::Smusher.optimize_images_in_folder(content)
  # end
  
end