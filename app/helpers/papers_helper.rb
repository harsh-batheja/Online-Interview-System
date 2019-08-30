module PapersHelper
	def format_time(duration)
		Time.at(duration).utc.strftime("%H:%M:%S")
	end

	def q_types
		["MCQ","MAQ","True False"]
	end
end
