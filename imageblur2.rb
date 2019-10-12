class Image

  def initialize(picture)
	@picture = picture
  end

  def get_coords
	coords = []
	  @picture.each_with_index do |row, row_number|
		row.each_with_index do |item, col_number|
		  if item == 1
			coords << [row_number, col_number]
		  end
		end
	  end
	  coords
	end

	def blur!
	  coords = get_coords
	    @picture.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          coords.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @picture[row_number -1][col_number] = 1 unless row_number == 0 #up
              @picture[row_number +1][col_number] = 1 unless row_number >= 3 #down
              @picture[row_number][col_number -1] = 1 unless col_number == 0 #left
              @picture[row_number][col_number +1] = 1 unless col_number >= 3 #right
            end
          end
        end
      end
  end


  def output_image
	@picture.each do |row|
	  puts row.join
	end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts
image.blur!

image.output_image

