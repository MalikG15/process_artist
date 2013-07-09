 require "ruby-processing"

class ProcessArtist < Processing::App
 	def setup
 	    background(0, 0, 0)
 	end

 	def draw
 		stroke(0, 0, 0)
 		if @size.nil? || @size == 250
 			@size = 1
 		else
 			@size = @size + 1
 		end

 		fill(0, 255, 255)
 		rect(@size, @size, @size, @size)
 		fill(255, 0, 255)
 		oval(@size, @size, @size, @size)
	end
end

FirstSketch.new(:width => 600, :height => 600,
	:title => "FirstSketch", :full_screen => false)