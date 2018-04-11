
# Program to find platforms to land flights without waiting time for them

class PlaneLanding
  def initialize()
    @@totalPlatforms = 0
  end

  # Function to take flight timings from user and pass to the sortFlightTimings to sort timings
  def fetchData()
    puts "Enter the number of flight count : "
    @flightsCount = gets.chomp.to_i

    if(@flightsCount.between?(1,10))
      @arrArrivalFlight = Array.new(@flightsCount)
      @arrDeptFlight = Array.new(@flightsCount)

      for i in (1..@flightsCount) do
        puts "Enter arrival time of #{i}th flight"
        arrivalFlightTime = gets.chomp.to_f
        @arrArrivalFlight.push(arrivalFlightTime)

        puts "Enter departure time of #{i}th flight"
        deptFlightTime = gets.chomp.to_f

        if(deptFlightTime < arrivalFlightTime)
          # if dept timings is less than arrival timings then redo the current loop process
          puts "Departure time cannot be less than arrival time, please reenter the  data\n\n"
          redo
        end
        @arrDeptFlight.push(deptFlightTime)
        puts
      end
      # Pass arrival and dept data after removing nill values to sort timings
      sortFlightTimings(@arrArrivalFlight.compact, @arrDeptFlight.compact)
    else
      puts "Invalid flight entry"
    end
  end

  # Function is used to sorting the times of arrival and dept time and pass sorted data to countPlatform
  def sortFlightTimings(arrArrivalFlight, arrDeptFlight)
    for i in (0...@flightsCount) do
      for j in (i+1...@flightsCount) do
        if(arrArrivalFlight[i] > arrArrivalFlight[j])
          sortArr = arrArrivalFlight[i]
          arrArrivalFlight[i] = arrArrivalFlight[j]
          arrArrivalFlight[j] = sortArr

          sortDept = arrDeptFlight[i]
          arrDeptFlight[i] = arrDeptFlight[j]
          arrDeptFlight[j] = sortDept
        end
      end
    end
    countPlatform(arrArrivalFlight, arrDeptFlight)
  end

  # Function is used to calculate count platforms where all flights can be land
  def countPlatform(arrArrivalFlight, arrDeptFlight)
    i = j = pipe = 0
    
    while  i < (@flightsCount-1) && j < (@flightsCount-1) do
      # Count the current elements dept timing and next elements arrival timing
      if ( arrDeptFlight[ j ] > arrArrivalFlight[ i+1 ] ) 
        pipe += 1
        i += 1
        @@totalPlatforms = pipe > @@totalPlatforms ? pipe : @@totalPlatforms
      else
        pipe = pipe == 0 ? 0 : pipe-1
        j += 1
      end
    end
    puts "Number of platforms : #{@@totalPlatforms}"
  end
end

plane = PlaneLanding.new
plane.fetchData

