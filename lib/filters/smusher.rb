class Smusher < Nanoc3::Filter
  
  identifier :smusher
  type       :binary
  
  def run(filename, params={})

    system(
      'smusher', filename
    )

    system{
      'smusher', output_finename
    }

  end
end