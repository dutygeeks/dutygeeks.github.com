class Optipng < Nanoc3::Filter
  identifier :optipng
  type       :binary

  def run(filename, params={})
    system(
      'optipng',
      '-quiet',
      filename,
      '-out', output_filename
    )
  end
end
