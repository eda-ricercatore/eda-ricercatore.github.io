#!/usr/bin/ruby

=begin
	This is a Ruby program that I use to create schedule for my food diary
	to keep track of my rotation diet to combat my food allergies.
	
	It takes in the following parameters to create the food diary:
	*the first day of the schedule: e.g., Monday
	*date in the month/day/year (mm/dd/yy) format: e.g., 12/25/2010
	*the pair of carbohydrates for the day (carb1:carb2): e.g., oat:millet
	*the type of meat for the day: e.g., chicken
	*the fish combination: e.g., sting ray:prawn
	*the next vegetable to be consumed: e.g., zucchini
	*the number of days to generate this food diary: e.g., 31
	
	The schedule for the food diary will be created in the normal text
	file format with the filename: food_diaryMonthDateYear.txt
	

	Copyright (C) 2009 Zhiyang Ong

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
=end

###########################################################################
# Days of the week
$days = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]
# Meals of the day
$meals = [ "Breakfast", "Lunch", "Dinner" ]
# Months of the year
$months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
# Types of carbohydrate pairs
$carbs = [ "oatmeal:millet", "pumpkin:sweetpotato", "yam:lentils", "quinoa:tapioca", "millet:oatmeal", "sweetpotato:pumpkin", "lentils:yam", "tapioca:quinoa" ]
# Types of meat (shrimp=prawn and fish=sting ray)
#$meat = [ "pork", "sting ray:prawn", "sting ray:squid", "prawn:squid", "crab", "lobster", "beef", "mutton", "lamb", "chicken", "egg", "duck", "turkey" ]
$meat = [ "pork", "fish", "beef", "lamb", "chicken", "duck" ]
# "egg" String
$egg = "egg"
# Types of meat (shrimp=prawn and fish=sting ray)
$fish = [ "stingray:prawn", "stingray:squid", "prawn:squid" ]
# Types of vegetables
#$vege = [ "zucchini", "pea", "brusselssprout", "bittergourd", "leek", "red pepper", "broccoli", "ladyfinger", "beetroot", "cauliflower", "radish", "celery", "asparagus", "eggplant", "cucumber", "lettuce" ]
$vege = [ "zucchini", "pea", "bittergourd", "leek", "red pepper", "broccoli", "ladyfinger", "beetroot", "cauliflower", "radish", "celery", "asparagus", "eggplant", "cucumber", "lettuce" ]
#Types of fruits
$fruits = [ "apples", "avocardo", "papaya", "jackfruit", "milk", "soursop", "redbean", "kiwi", "pineapple", "mango", "banana", "longan", "durian", "grape", "pear", "guava", "soursop" ]
#Current carbohydrate being consumed
$cur_carb = "oatmeal:millet"
#Current meat being consumed
$cur_meat = "pork"
#Current "fish" being consumed for the past 6 days; default "fish" is "stingray:prawn"
$cur_fish = "stingray:prawn"
#Current vegetable being consumed
$cur_veg = "zucchini"
# Months with 30 days
$mth30 = [ 4, 6, 9, 11 ]
#Current day; default day is 1
$cur_day = 1
#Current month; default month is 1
$cur_mth = 1
#Current year; default year is 2009
$cur_year = 2009
#Index of the current day in "$days"; default value is indexed to Monday
$index_of_cur_day = 0

=begin
	Use the accessor/mutator methods to access/modify these variables:
	$cur_day, $cur_mth, and $cur_year
	
	See below for these methods...
=end

#Prefix of output filename; default value is "food_diary"
$op_file_prefix = "food_diary"
#Body of output filename; default value is "MonthDateYear"
$op_file_body = "MonthDateYear"
#Suffix of output filename to indicate the file format; default value is ".txt"
$op_file_suffix = ".txt"
# Name of the output filename
$op_filename = $op_file_prefix + $op_file_body + $op_file_suffix
# Duration of the food diary; default value of 1
$duration = 1
#Number of days per week
$num_days_per_wk = $days.length									# 7
# Number of months in a year
$num_mths = $months.length										# 12
# Duration between leap years (in number of years)
$leap_num_yr = 4
# Number of days in a 31-day month
$num_days_31mth = 31
# Number of days in a 30-day month
$num_days_30mth = 30
# Number of days in a 29-day February
$num_days_29feb = 29
# Number of days in a 28-day February
$num_days_28feb = 28
# The index of the month of February
$index_of_feb = 2


###########################################################################
=begin
	Method to print the HELP menu for the singular "-help" option
	@return		Nothing
=end
def help_menu
	puts "HELP menu"
	puts "The following parameters are needed to create the food diary:"
	puts "Parameter #1: the first day of the schedule: e.g., Monday"
	puts "Parameter #2: date in the month/day/year (mm/dd/yy) format: e.g., 12/25/2010"
	puts "Parameter #3: the pair of carbohydrates for the day (carb1:carb2): e.g., oat:millet"
	puts "Parameter #4: the type of meat for the day: e.g., chicken"
	puts "Parameter #5: the fish combination: e.g., sting ray:prawn"
	puts "Parameter #6: the next vegetable to be consumed: e.g., zucchini"
	puts "Parameter #7: the number of days to generate this food diary: e.g., 31"
	puts "Run the program as follows:"
	puts "/get_food_diary.rb [Parameter #1] [Parameter #2] [Parameter #3] [Parameter #4] [Parameter #5] [Parameter #6] [Parameter #7]"
end



###########################################################################
=begin
	Accessor and mutator methods for the variables $cur_day, $cur_mth, and
	$cur_year
	
	That will help prevent corruption of these variables.
=end


###########################################################################
=begin
	Method to get the current day of the date
	@return		The current day of the date
=end
def get_cur_day
	return $cur_day.to_i
end

###########################################################################
=begin
	Method to get the current month of the date
	@return		The current month of the date
=end
def get_cur_mth
	return $cur_mth.to_i
end

###########################################################################
=begin
	Method to get the current year of the date
	@return		The current year of the date
=end
def get_cur_year
	return $cur_year.to_i
end


###########################################################################
=begin
	Method to set the current day of the date
	@param dd		The current day of the date
	@return			Nothing
=end
def set_cur_day(dd)
	$cur_day = dd
end

###########################################################################
=begin
	Method to set the current month of the date
	@param mm		The current month of the date
	@return			Nothing
=end
def set_cur_mth(mm)
	$cur_mth = mm
end

###########################################################################
=begin
	Method to set the current year of the date
	@param yyyy		The current year of the date
	@return			Nothing
=end
def set_cur_year(yyyy)
	$cur_year = yyyy
end



###########################################################################
=begin
	Method to check if the day of the week is valid
	@param d	A day of the week
	@return		Nothing
=end
def check_day(d)
	if !$days.include?(d)
		puts "================"
		puts "ERROR MESSAGE!!!"
		puts ""
		puts "Days of the week are:"
		puts "Monday"
		puts "Tuesday"
		puts "Wednesday"
		puts "Thursday"
		puts "Friday"
		puts "Saturday"
		puts "Sunday"
		raise "Invalid day entered!"
	end
	
	# Set the day
	set_index_for_cur_day($days.index(d))
end

###########################################################################
=begin
	Method to convert the numerical representation of a month into its verbal
	representation
	@param mth	A number that represents the month of the year; range of its
				values is restricted between 1 and 12, inclusive
	@return		The verbal representation of the month as a String
=end
def month_num_to_ver(mth)
	# Check if the value of mth is in the valid range
	if (1 > mth.to_i)  or ($num_mths < mth.to_i)
		raise "The value indicating the month is restricted between 1 and 12, inclusive."
	end

	mth_v = case mth.to_i
		when 1	then $months[0]
		when 2	then $months[1]
		when 3	then $months[2]
		when 4	then $months[3]
		when 5	then $months[4]
		when 6	then $months[5]
		when 7	then $months[6]
		when 8	then $months[7]
		when 9	then $months[8]
		when 10	then $months[9]
		when 11	then $months[10]
		# Else, it must be "December", since values of (mth < 12) is required
		else	$months[11]
		end

	return mth_v
end


###########################################################################
=begin
	Method to extract the given day, month, and year
	@param d	Date
	@return		Nothing
=end
def extract_day_mth_yr(given_date)
	tmp_new_date = given_date.split('/')
	# Get the current month
	set_cur_mth(tmp_new_date[0])
	# Get the current day
	set_cur_day(tmp_new_date[1])
	# Get the current year
	set_cur_year(tmp_new_date[2])
	# Get the body of the output filename
	$op_file_body = "_"+ month_num_to_ver(get_cur_mth) +"_"+ get_cur_day.to_s + "_" + get_cur_year.to_s
	# Get the name of the output filename
	$op_filename = $op_file_prefix + $op_file_body + $op_file_suffix
end


###########################################################################
=begin
	Method to check if the date is valid
	@param d		A date
	@precondition	Date must contain >= 3 fields
	@return			Nothing
=end
def check_date(dt)
	# Delimit the string using the slash character: "/"
	delimited_date = dt.split('/')
=begin
	Precondition
	If the delimited date does not have three arguments for month, day,
	and year, indicate that the date is invalid
=end
	if 3 > delimited_date.length
		raise "Invalid date has less than 3 fields."
	end
	
	# Check if month is less than 1, or greater than 12
	if (1 > delimited_date[0].to_i) or ($num_mths < delimited_date[0].to_i)
		raise "Values for month in the date must lie between 1 and 12, inclusive."
	end
	
	# Check if day is less than 1, or greater than 31
	if (1 > delimited_date[1].to_i) or ($num_days_31mth < delimited_date[1].to_i)
		raise "Values for day in the date must lie between 1 and 31, inclusive."
	end
	
	# If the month is Feb, check if day > 29
	if ($index_of_feb == delimited_date[0].to_i) and ($num_mths < delimited_date[1].to_i)
		raise "Day in the date must be < 30 for February."
	end
	
	# If the month is Feb and it is not a leap year, check if day > 29
	if ($index_of_feb == delimited_date[0].to_i) and (0 != (delimited_date[2].to_i).modulo($leap_num_yr)) and ($num_days_28feb < delimited_date[1].to_i)
		puts "delimited_date[0].to_i).modulo(4)::"+delimited_date[0].to_i.modulo($leap_num_yr).to_s
		raise "Day in the date must be < 29 for February when it is not a leap year."
	end
	
	# Check if a 30-day month has been indicated with >30 days
	if ($mth30.include?(delimited_date[0].to_i)) and ($num_days_30mth < delimited_date[1].to_i)
		raise "Selected month "+delimited_date[0]+" should not have >30 days."
	end
	
	# Check if year < 2009
	if 2009 > delimited_date[2].to_i
		raise "Values for year must be after 2008."
	end
	
	# Extract the current day, month, and year
	extract_day_mth_yr(dt)
end

###########################################################################
=begin
	Method to check if a valid carbohydrate pair is entered
	@param d	A carbohydrate pair
	@return		Nothing
=end
def check_carbo(carbo)
	if !($carbs.include?(carbo))
		raise "A valid carbohydrate pair has NOT been entered."
	end
	
	# Set the current carbohydrate
	set_next_carb(carbo)
end


###########################################################################
=begin
	Method to check if a valid type of meat is entered
	@param d	A type of meat
	@return		Nothing
=end
def check_meat(mt)
	if !($meat.include?(mt))
		raise "A valid type of meat has NOT been entered."
	end
	
	# Set the current meat
	set_next_meat(mt)
end


###########################################################################
=begin
	Method to check if a valid type of fish is entered
	@param d	A type of fish
	@return		Nothing
=end
def check_fish(fh)
	if !($fish.include?(fh))
		raise "A valid type of fish has NOT been entered."
	end
	
	# Set the current fish
	set_next_fish(fh)
end


###########################################################################
=begin
	Method to check if a valid type of vegetable is entered
	@param d	A type of vegetable
	@return		Nothing
=end
def check_veg(vg)
	if !($vege.include?(vg))
		raise "A valid type of vegetable has NOT been entered."
	end
	
	# Set the current vegetable
	set_next_veg(vg)
end


###########################################################################
=begin
	Method to check if the number of days to generate for the schedule is valid
	@param d	A number of days
	@return		Nothing
=end
def check_schedule(range_of_days)
	if 1 > range_of_days.to_i
		raise "The schedule of the diary must last for at least one day."
	elsif 40 < range_of_days.to_i
		raise "Save paper! Don't generate schedule for >40 days."
	end
	
	# Set the duration of the food diary
	$duration = range_of_days.to_i
end


###########################################################################
=begin
	Method to increment the index of the current day in the array "$days"
	@return		Nothing
=end
def incre_index_for_cur_day
	$index_of_cur_day = (get_index_of_cur_day + 1).modulo($num_days_per_wk)
end



###########################################################################
=begin
	Method to set the index of the current day in the array "$days"
	@param index_cday	The index of the current day in the array "$days"
	@return				Nothing
=end
def set_index_for_cur_day(index_cday)
=begin
	Precondition
	index_cday must lie between 0 and 6, to correspond to days of the week
=end
	if (0 > index_cday) or (($num_days_per_wk-1) < index_cday)
		raise "index_cday is not between 0 & 6."
	end

	$index_of_cur_day = index_cday
end



###########################################################################
=begin
	Method to get the index of the current day in the array "$days"
	@return		The index of the current day in the array "$days"
=end
def get_index_of_cur_day
	return $index_of_cur_day
end


###########################################################################
=begin
	Method to get the number of days in February
	
	### NOTE: Is this method being used at all?
	@param d	Year
	@return		The number of days in February for the indicated year
=end
def get_num_feb_days_cur_yr(yr)
	if (0 == yr.to_i.modulo($leap_num_yr))
		return $num_days_29feb
	else
		return $num_days_28feb
	end
end



###########################################################################
=begin
	Method to check if the current day is valid
	@param cd	The current day
	@return		Nothing
=end
def check_cur_day
	# Check if the current day is within 1 and 31, inclusive
	if ($num_days_31mth < get_cur_day) or (1 > get_cur_day)
		raise "The current day is not valid!"
	end
	# Check if a 30-day month has more than 30 days
	if ($mth30.include?(get_cur_mth)) and ($num_days_30mth < get_cur_day)
		raise "A 30-day month shall have <31 days."
	end
	
	# Check if February has more than 29 days in a leap year
	if ($index_of_feb == get_cur_mth) and ($num_days_29feb < get_cur_day) and (0 == get_cur_year.modulo($leap_num_yr))
		raise "February has 29 days in a leap year."
	end
	
	# Check if February has more than 28 days in non-leap years
	if ($index_of_feb == get_cur_mth) and ($num_days_28feb < get_cur_day) and (0 != get_cur_year.modulo($leap_num_yr))
		raise "February has 28 days in non-leap years."
	end
end


###########################################################################
=begin
	Method to check if the current month is valid
	@param cm	The current month
	@return		Nothing
=end
def check_cur_mth
	# Check if the current month is within 1 and 12, inclusive
	if ($num_mths < get_cur_mth) or (1 > get_cur_mth)
		raise "The current month is not valid!"
	end
end


###########################################################################
=begin
	Method to check if the current year is valid
	@param cy	The current year
	@return		Nothing
=end
def check_cur_year
	# Check if the current year is after 2009
	if 2009 > get_cur_year
		raise "The current year is not valid!"
	end
end


###########################################################################
=begin
	Method to get the next day
	@return		Nothing
=end
def get_next_day
	# Precondition: Check if current day and month are valid
	check_cur_day
	check_cur_mth

=begin
	Due to the differences in the length of months, setting the next day
	depends on the current month
=end
	case get_cur_mth
		# For 31-day months
		when 1,3,5,7,8,10,12
			# If it is not the 31st of the month
			if ($num_days_31mth > get_cur_day)
				# Move on to the next day
				set_cur_day(get_cur_day+1)
			# Then, it must be the last day of the month
			else
				# Move on to the next month
				get_next_mth
				# Set the day of the month to be the first
				set_cur_day(1)
			end
		# For February
		when 2
			# If it is not the 29th of February in a leap year
			if ($num_days_29feb > get_cur_day) and (0 == get_cur_year.modulo($leap_num_yr))
				# Move on to the next day
				set_cur_day(get_cur_day+1)
			# Else, if it is not the 28th of February in a non-leap year
			elsif ($num_days_28feb > get_cur_day) and (0 != get_cur_year.modulo($leap_num_yr))
				# Move on to the next day
				set_cur_day(get_cur_day+1)
			# Then, it must be the last day of the month
			else
				# Move on to the next month
				get_next_mth
				# Set the day of the month to be the first
				set_cur_day(1)
			end
		# For 30-day months
		when 4,6,9,11
			# If it is not the 30th of the month
			if ($num_days_30mth > get_cur_day)
				# Move on to the next day
				set_cur_day(get_cur_day+1)
			# Then, it must be the last day of the month
			else
				# Move on to the next month
				get_next_mth
				# Set the day of the month to be the first
				set_cur_day(1)
			end
		else
			raise "The current month is invalid; precondition check FAILED!!!"
	end
end



###########################################################################
=begin
	Method to get the next month
	@return		Nothing
=end
def get_next_mth
	# Precondition: Check if current month is valid
	check_cur_mth

	# Is the current month December?
	if get_cur_mth == $num_mths
		# Yes, set the current month to January
		set_cur_mth(1)
		# Move on to the next year
		get_next_yr
	else
		# Else, move on to the next month
		set_cur_mth((get_cur_mth+1).modulo($num_mths))
	end
end



###########################################################################
=begin
	Method to get the next year
	@return		Nothing
=end
def get_next_yr
	set_cur_year(get_cur_year+1)
end



###########################################################################
=begin
	Method to set the next carbohydrate to eat
	@param cbhd		The next carbohydrate to eat
	@return			Nothing
=end
def set_next_carb(cbhd)
	# Check if the next carbohydrate to eat is valid
	#check_carbo(cbhd)
	
	$cur_carb = cbhd
end


###########################################################################
=begin
	Method to move to the next carbohydrate to eat
	@return			Nothing
=end
def nxt_carb
	# Get the index of the next carbohydrate
	tmp_index = ($carbs.index(get_carb) + 1).modulo($carbs.length)
	
	# Move to the next carbohydrate pair
	$cur_carb = $carbs[tmp_index]
end


###########################################################################
=begin
	Method to get the current carbohydrate to eat
	@return			The current carbohydrate to eat
=end
def get_carb
	# Return the current carbohydrate to eat
	return $cur_carb
end



###########################################################################
=begin
	Method to set the next meat to eat
	@param mtt		The next meat to eat
	@return			Nothing
=end
def set_next_meat(mtt)
	# Check if the next meat to eat is valid
	#check_meat(mtt)
	
	$cur_meat = mtt
end

###########################################################################
=begin
	Method to move to the next meat to eat
	@return			Nothing
=end
def nxt_meat
	# Get the index of the next meat
	tmp_index = ($meat.index(get_meat) + 1).modulo($meat.length)
	
	# Move to the next meat pair
	$cur_meat = $meat[tmp_index]
end

###########################################################################
=begin
	Method to get the current meat to eat
	@return		The current meat to eat
=end
def get_meat
	# Return the current meat to eat
	return $cur_meat
end


###########################################################################
=begin
	Method to set the next fish to eat
	@param fhh		The next fish to eat
	@return			Nothing
=end
def set_next_fish(fhh)
	# Check if the next fish to eat is valid
	#check_fish(fhh)
	
	$cur_fish = fhh
end

###########################################################################
=begin
	Method to move to the next fish to eat
	@return			Nothing
=end
def nxt_fish
	# Get the index of the next fish
	tmp_index = ($fish.index(get_fish) + 1).modulo($fish.length)
	
	# Move to the next fish pair
	$cur_fish = $fish[tmp_index]
end

###########################################################################
=begin
	Method to get the current fish to eat
	@return		The current fish to eat
=end
def get_fish
	# Return the current fish to eat
	return $cur_fish
end


###########################################################################
=begin
	Method to set the next vegetable to eat
	@param vgg		The next vegetable to eat
	@return			Nothing
=end
def set_next_veg(vgg)
	# Check if the next vegetable to eat is valid
	#check_veg(vgg)
	
	$cur_veg = vgg
end

###########################################################################
=begin
	Method to move to the next vegetable to eat
	@return			Nothing
=end
def nxt_veg
	# Get the index of the next vegetable
	tmp_index = ($vege.index(get_veg) + 1).modulo($vege.length)
	
	# Move to the next vegetable pair
	$cur_veg = $vege[tmp_index]
end

###########################################################################
=begin
	Method to get the current vegetable to eat
	@return		The current vegetable to eat
=end
def get_veg
	# Return the current vegetable to eat
	return $cur_veg
end


###########################################################################


puts "==================================================================="
puts "==================================================================="
puts ""

# Verifying if preconditions have been met...

# Check if at least SEVEN arguments have been passed to the program
if 7 > ARGV.length
	if ARGV[0] == "-help"
		help_menu
	end

	raise ArgumentError, "7 input arguments are required."
end
# Check if the day of the week is entered correctly
check_day(ARGV[0])
# Check if a valid date is entered
check_date(ARGV[1])
# Check if a valid carbohydrate pair is entered
check_carbo(ARGV[2])
# Check if a valid type of meat is entered
check_meat(ARGV[3])
# Check if a valid type of fish is entered
check_fish(ARGV[4])
# Check if a valid type of vegetable is entered
check_veg(ARGV[5])
# Check if the number of days to generate for the schedule is valid
check_schedule(ARGV[6])

###########################################################################

puts "Generating food diary..."
puts ""
puts "Printing input arguments for verification..."
puts "First day of the schedule: " + ARGV[0] + ":::" + $days[get_index_of_cur_day]
print "Date in the month/day/year (mm/dd/yy) format: " + ARGV[1] + ":::"
puts get_cur_mth.to_s + "/" + get_cur_day.to_s + "/" + get_cur_year.to_s
puts "Pair of carbohydrates for the day (carb1:carb2): " + ARGV[2] + ":::" + get_carb
puts "Type of meat for the day: " + ARGV[3] + ":::" + get_meat
puts "The fish combination: " + ARGV[4] + ":::" + get_fish
puts "The next vegetable to be consumed: " + ARGV[5] + ":::" + get_veg
puts "Number of days to generate this food diary: " + ARGV[6] + ":::" + $duration.to_s
puts ""
puts "Output filename: " + $op_filename
puts ""

###########################################################################

# Create the output file using the new output filename
opFile = File.new($op_filename, "w")

###########################################################################
# For the duration requested for the schedule of the food diary
$duration.times do
	# Print details of the day and date...
	opFile.print $months[get_cur_mth-1] + " " + get_cur_day.to_s + ", "
	opFile.puts get_cur_year.to_s + " - " + $days[get_index_of_cur_day]
	
	# Carbohydrate pair for the day
	tmp_carbs = get_carb.split(':')
	# Fish pair for the day
	tmp_fish = get_fish.split(':')
	
	# Print the details for breakfast
	opFile.puts $meals[0] + ": " + tmp_carbs[0]
	
	# Print the details for lunch
	opFile.print $meals[1] + ": " + tmp_carbs[1] + " / "
	# Am I having fish today?
	if $meat[1] == get_meat
		opFile.print tmp_fish[0]
	else
		# Nope
		opFile.print get_meat
	end
	opFile.puts " / " + get_veg
	
	# Get the next vegetable for dinner
	nxt_veg
	
	# Print the details for dinner
	opFile.print $meals[2] + ": " + tmp_carbs[0] + " / "
	# Am I having fish today?
	if $meat[1] == get_meat
		opFile.print tmp_fish[1]
		# Get the next fish
		nxt_fish
	else
		# Nope
		opFile.print get_meat
	end
	# Am I having chicken today?
	if $meat[4] == get_meat
		opFile.print " / egg"
	end
	opFile.puts " / " + get_veg
	
	# Get the next carb
	nxt_carb
	# Get the next meat
	nxt_meat
	# Get the next vegetable for dinner
	nxt_veg
	# Move on to the next day
	get_next_day
	incre_index_for_cur_day
	
	opFile.puts ""
	opFile.puts ""
	opFile.puts ""
end





##### $index_of_cur_day



#month_num_to_ver(3)

# Close the output file stream
opFile.close

###########################################################################
puts ""
puts "==================================================================="
puts "==		END		END		END		=="
puts "==================================================================="
