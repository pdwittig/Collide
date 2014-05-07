# module Havershine
# 	EARTH_RADIUS = 3961

# 	def self.calc_distance(lat1, lat2, lon1, lon2)
# 		lon_dist = lon_dist(lon1, lon2)
# 		lat_dist = lat_dist(lat1, lat2)
# 		inner_calc = inner_calc(lat_dist, lat1, lat2, lon_dist)
# 		outer_calc = outer_calc(inner_calc)
# 		return outer_calc * EARTH_RADIUS 
# 	end

# 	def self.lon_dist lon1, lon2
# 		lon2 - lon1
# 	end

# 	def self.lat_dist lat1, lat2
# 		lat2 - lat1
# 		# p lat2
# 		# p lat1
# 	end

# 	def self.inner_calc lat_dist, lat1, lat2, lon_dist
# 		(Math.sin(lat_dist / 2))**2 + Math.cos(lat1) * Math.cos(lat2) * (Math.sin(lon_dist / 2))**2
# 	end

# 	def self.outer_calc inner_calc
# 		2 * Math.atan2(Math.sqrt(inner_calc), Math.sqrt(1 - inner_calc))
# 	end
# end