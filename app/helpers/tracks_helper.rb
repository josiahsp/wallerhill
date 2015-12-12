module TracksHelper

	def seconds_to_time(sec)
		hours = sec / 3600
		minutes = sec / 60
		seconds = sec % 60
		
		hours = hours.to_s
		minutes = minutes.to_s
		seconds = seconds.to_s
		time = ""
		
		if hours.to_i > 0
			time = hours + ":"
			
			if minutes.to_i < 10
				minutes = "0" + minutes
			end
		end
		
		if seconds.to_i < 10
			seconds = "0" + seconds
		end
		
		time = time + minutes + ":" + seconds
		
		return time
	end

end
