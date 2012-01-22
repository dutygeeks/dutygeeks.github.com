class Optipng < Nanoc3::Filter
  identifier :optipng
  type       :binary

  def run(filename, params={})
    system(
      'optipng',
      '-quiet',
      '-o', params[:level].to_s,
      filename,
      '-out', output_filename
    )
  end
end
