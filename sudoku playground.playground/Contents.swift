import UIKit

/*
 Function to see if player's guess is valid
 [{Int}] where each subbray has 3 values
 arr[0] is row for guess
 arr[1] is column for guess
 arr[2] is value being guessed (aka, can I add this number to my sudoku problem)
 
 How I tracked this info (the guesses)?
 - dictionary -> store the value as a key, have the coordinates as an array of tuples
 [Int: [(Int,Int)] ]
 [value: [(row,column)]]
 how did you use this? Checked if a value (arr[2]) is a key, then see if the dictionary value for the key is in that [(row,column)] array has the row and column from the games (arr[0],arr[1])
 How would I account for subgrids
 by using 3 different dictionaries(rowDict,columnDict, subgridDict)
 array -> there are 81 possible locations for a guess
 -How many guesses can go in a column? -> 9
 -How many guesses can go in a row? -> 9
 
 */
func validateGuesses(sudokuMatrix: [[Int]]) -> Bool {
    var grid = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    
    for guess in sudokuMatrix {
        var row = guess[0] - 1
        var column = guess[1] - 1
        var value = guess[2]
        
        for i in 0...8 {
            
            if grid[row][i] == value {
                return false
            }
            if grid[i][column] == value {
                return false
            }
        }
        let subgridRowStartIndex = row / 3 * 3
        let subgridColumnStartIndex = column / 3 * 3
                
        for i in subgridRowStartIndex...(subgridRowStartIndex * 2) {
            for j in subgridColumnStartIndex...(subgridColumnStartIndex * 2) {
                if grid[i][j] == value {
                    return false
                }
            }
          }
        // Validate the row/column and subgrid
        grid[row][column] = value
       }
      return true
                
    }
        

    func validateWithArray(sudokuMatrix: [(Int)]) -> Bool {
        // how should we construct our array?
        // We could have an array of arrays.
        // How many subarrays should there be? 9
        // How many elements should be in each subarray?
        // What kind of variable can I create that can hold values?                                               - I can create another repeating array inside of the first repeating array.
        // By default an empty space holds the value if zero. This will be important when we create our solver
        /*
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0]]
         */
        
        var grid = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        
        // Our grid is a fixed size (9 rows x 9 columns), meaning when we look through we dont have to check some dynamic number
        // To look at each row, look at row #s 1-9, which in computers is indexes 0-8
        // Subscripts allow us to to access elements within various collections, like arrays and dictionaries, is something that's very common. Not to be confused with a method. Subscripts are to find a value rather that perform an action.
        // To subscript for a row, grid[0][0...8] -> grid[0] ->grid[rowFromGuess]
        
        // To look at each column, lookat columns 1-9
        // TO subscript for a column grid[someNumber][columnFromGuess]
        
        //because of the fixed size, to get to any row and match it against the guessed row, and to any column and match it against the guessed column we can just iterate through a "static" range 0...8)
        // guess[0] is row, guess[1] is column, guess[2] is the value being guessed for that row/column space
        
        
        /* for guess in sudokuMatrix {
         // row is 1...9
         // to match the indices of this array, row must be 0...8
         
         /*
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0]]
          */
         
         let row = guess[0] - 1
         let column = guess[1] -1
         let value = guess[2]
         // we can also use guess.last it would return as an optional
         
         for i in 0...8 {
         // row
         if grid[row][i] == value {
         return false
         }
         if grid[i][column] == value{
         return false
         }
         }
         let subgridRowStartIndex = row / 3 * 3
         let subgridColumnStartIndex = column / 3 * 3
         
         for i in subgridRowStartIndex...(subgridRowStartIndex * 2) (
         for j in subgridColumnStartIndex...(subgridColumnStartIndex * 2) {
         if grid[i][j] == value {
         return false
         }
         }
         }
         // Validate the row/column and subgrid
         grid[row][column] = value
         }
         return true
         
         } */
        //row and column are both 9 long so we can iterate through(performs the function and returns a value for each guess)
        // if we know the row and the column we can find the subgrid using math
        // rows of center subgrid -> 4,5,6 (indicies are 3,4,5)
        // columns of center subgrid -> 4,5,6(indicies are 3,4,5)
        //Computer math helps here (regular math sucks)
        // What kind of math would help here? Whats peculiar about compiter math?                              - They round down in division when there is any remainder/decimal
        // first subgrid goes from (0,2) to (2,2)
        // second subgrid goes from (0,3) to (2,5)
        // third subgrid goes from (0,6) to (2,8)
        
        // if for any row or column we can fin the starting point of that subgrid, we can iterate through a short range
        // FIRST SUBGRID
        //for i in 0...2 {
        //for j in 0...2 {
        // if grid [i][j] == value{
        // return false
        //       }
        //   }
        //}
        
        //pattern works for any subgrid as long as we can find the indicies of the top-left element of the subgrid, we can iterate through a short range
        // for i in 0...2 {
        // for j in 3...5 {
        // if grid [i][j] == value{
        //  return false }                                                                             }                                                                                    }
        //        for any pattern if we divide row and column each by three, we can find the starting point by then multiplying by three
        // example 7/3 = 2 but 2*3 = 6
        // dividing by 3 with no remainder allows us to automatically shoot us bak up to the top left row
        
        //because sudoku is a fixed size we can just do the math to make things wor k in the context of the game
        let subgridRowStartIndex = row / 3 * 3
        let subgridColumnStartIndex = column / 3 * 3
        
        for i in subgridRowStartIndex...(subgridRowStartIndex * 2) (
            for j in subgridColumnStartIndex...(subgridColumnStartIndex * 2) {
                if grid[i][j] == value {
                    return false
                }
                )
            }
                }
                return false
                
                }
                
                func validateWithDict(sudokuMatrix: [(Int)]) -> Bool
                
                var dict = [Int:[(Int,Int)]]()
                var tupleArr = [(Int,Int)]()
                
                // a is the guess (as an array)
                for a in sudokuMatrix {
                    //dictionary has the value so the key wont be nil
                    if dict[a[2]] != nil {
                        for i in dict[a[2]]! {
                            //for given value if the row or the column matches
                            if i.0 == a[0] || i.1 == a[1] {
                                return false
                            }
                        }
                        
                        //otherwise append now (row,column) tuple to the array at that key. The key is also known as the guessed value
                        
                        tupleArr = dict[a[2]]!
                        tupleArr.append((a[0],a[1]))
                        dict[a[2]] = tupleArr
                    } else {
                        // default case when the dictionary doesn't have a key for the guessed value
                        dict[a[2]] = [(a[0],a[1])]
                    }
                }
                return true
                
                let testSetOne = ((Int))()
                
                let testSetTwo = [
                    [2,2,5], // 5 in row 2
                    [2,5,1],
                    [5,2,3], // 5 in row 2
                    [2,8,5]]
                
                let testSetThree = [
                    [3,1,3],
                    [2,8,3],
                    [1,4,3],
                    [7,2,3],
                    [6,3,3],
                    [5,5,3],
                    [4,7,3],
                    [8,6,3],
                    [9,9,3]]
                
                let testSetFour = [
                    [3,1,3],
                    [1,2,3],
                    [1,4,3],
                    [7,2,3]]
                
                
                
                assert(validateWithDict(sudokuMatrix: testSetOne) == true)
                assert(validateWithDict(sudokuMatrix: testSetTwo) == false)
                assert(validateWithDict(sudokuMatrix: testSetThree) == true)
                assert(validateWithDict(sudokuMatrix: testSetFour) == false)
