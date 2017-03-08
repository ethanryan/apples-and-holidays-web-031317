require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] = supply #adds supply to christmas
  holiday_hash[:winter][:new_years] = supply #adds supply to new_years
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] = supply #adds supply to memorial_day
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  #programmer_hash[:yukihiro_matsumoto] = {:known_for => "Ruby", :languages => ["LISP, C"] }

  #holiday_hash[:fall] = {:columbus_day => supply_array}
  #holiday_hash[:winter] = {:valentines_day => {} }
  # misunderstood with above two lines, need to make more generic and abstract:
  holiday_hash[season] = {holiday_name => supply_array} #add a new holiday and its associated supplies to any season
  holiday_hash #return holiday_hash
end


def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = [] #new empty array to hold winter supplies

  holiday_hash[:winter].collect do |key, value| #key=holiday, value=supplies
    winter_supplies << value #add each supply to winter_supplies array
  end #end collect loop
  winter_supplies.flatten #flatten the winter_supplies array and return it
end #end method


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |key, value|  #iterate through the key/value pairs in the first layer of the hash...

    puts key.to_s.capitalize + ":" #output key (the season) to string, capitalized, plus ":"

    value.each do |key, value| #then within that loop, iterate through the key/value pairs in the next layter of the hash...
      #binding.pry
      holiday = "  " + key.to_s.split("_").map(&:capitalize!).join(" ")
      supplies = ": " + value.join(", ")
      #####note: could also do the above two lines all on the below line, but i broken them into to variables, 'holiday' and 'supplies'
      #puts "  " + key.to_s.split("_").map(&:capitalize!).join(" ") + ": " + value.join(", ")
      puts holiday + supplies #and output the above holiday and supplies variables, formatted above to pass the test
    end #end value.each loop
  end #end holiday_hash.each loop
end #end method



def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = [] #empty array to hold bbq_holidays

  holiday_hash.each do |season, holiday|
    holiday.each do |key, value|
      #binding.pry
      #value.include?("BBQ") ###### this is working in pry.....
      if value.include?("BBQ")
        bbq_holidays << key ### push holiday (key) to bbq_holidays array if it includes "BBQ" as a supply (value)
      end #end if statement
      end #end each loop
  end #end each loop
  bbq_holidays #return bbq_holidays array
end #end method