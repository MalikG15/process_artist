require 'ruby-processing'
class ProcessArtist < Processing::App
	#This is my first ruby processing project and I love it!

	def setup
		background(255, 0, 0)
		@size = 10
		@queue = " "
	end

	def draw

	end
	
	def key_pressed
		warn "A key was pressed! #{key.inspect}"
		if @queue.nil?
			@queue = ""
		end

		if !key.is_a?(String)
			warn "That wasn't a string!"
			return
		end

		if key == "+"
			warn "You pressed plus"
			@size += 50
		elsif key == "-"
			warn "You pressed minus"
			@size -= 50
		 	if @size <= 5
		 		@size = 5
		 	end

		elsif key != "\n"
			@queue = @queue + key
	    else
			warn "Time to run the command: #{@queue}"
			run_command(@queue)
			@queue = " "
			@shape = @queue.chomp
		end
	end

	#def choose_shape_from_command (command)
	 #case command
		#when "s1" then warn "You chose s1"
		

	def run_command(command)
		puts "Running Command #{command}"
		if command.start_with?("b")
			color  = command[1..-1]
			colors = color.split(",")
			background(colors[0].to_i, colors[1].to_i, colors[2].to_i)
		end
	end
    	
	def mouse_pressed
		ellipse_mode CENTER
        rect_mode CENTER
		smooth
		oval(mouse_x, mouse_y, @size, @size)
		stroke(0, 0, 0)
		fill(50, 255, 50)
	end

	def mouse_dragged
	   ellipse_mode CENTER
        rect_mode CENTER
		oval(mouse_x, mouse_y, @size, @size)
		case @shape
			when "s1" then rect(mouse_x, mouse_y, 10, 10)
			when "s2" then rect(mouse_x, mouse_y, 20, 50)
	        when "s3" then oval(mouse_x, mouse_y, 30, 40)
	        else
	        	warn "I don't know that command"
	    end
    end

	def mouse_released
	end

end

ProcessArtist.new(:width => 800, :height => 800,
	:title => "ProcessArtist", :full_screen => false)
