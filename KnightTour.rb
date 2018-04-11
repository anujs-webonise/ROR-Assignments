
# Program to solve Knight Tour problem using Backtrack Algorithm

class KnightTour
    def initialize()
        @n = 5
        @arrSol = Array.new(@n) { Array.new(@n,"k") }
    end

    # Function to check if x and y are the valid position for @n * @n chessboard and if cell is unvisited
    # x = row
    # y = column
    # arrSol = array of @n * @n board
    def isValid(x, y, arrSol)
        return ( x >= 0 && x < @n && y >= 0 && y < @n && arrSol[x][y] == "k")
    end

    # Function to display solution of @n * @n chessboard
    # arrSol = array of @n * @n board
    def displayBoard(arrSol)
        puts "Knight Board of #{@n}*#{@n} which starts from (0,0) position \n\n"
        for x in (0...@n) do
            for y in (0...@n) do
                val = arrSol[x][y]
                print val < 10 ? " #{val} " : "#{val} "
            end
            puts
        end
    end

    # Function uses knightTourSolve() to solve which returns false if not possible or return true with printable solution
    def knightTourInit
        # Defines next move of knight of x and y both coordinates
        arrX = [ 2, 1, -1, -2, -2, -1, 1, 2 ]
        arrY = [ 1, 2, 2, 1, -1, -2, -2, -1 ]

        # For the first round
        @arrSol[0][0] = 0

        unless knightTourSolve(0, 0, 1, @arrSol, arrX, arrY)
            puts "No solution exists"
            return false
        else
            displayBoard(@arrSol)
        end
        return true
    end

    # Recursive function to solve problem statement
    # x = row
    # y = column
    # count = Displays "number" on the cell which initial value is 1 and then increment by 1
    # arrX = x coordinates
    # arrY = y coordinates
    def knightTourSolve(x, y, count, arrSol, arrX, arrY)
        # Checks untill last count reach
        if (count == @n * @n)
            return true
        end

        # Check in all 8 directions for all next moves from the current x and y
        for k in (0...8) do
            next_x = x + arrX[k]
            next_y = y + arrY[k]

            if (isValid(next_x, next_y, arrSol))
                arrSol[next_x][next_y] = count
                if (knightTourSolve(next_x, next_y, count+1, arrSol, arrX, arrY) == true)
                    return true
                else
                    @arrSol[next_x][next_y] = "k"
                end
            end 
        end
        return false
    end
end

knight = KnightTour.new
knight.knightTourInit

