import Foundation


do {
    let boardString = "..3.2.6..9..3.5..1.18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3.."
    let board = Board(boardString: boardString)
    let solver = Solver(board: board)
    
    print(board)
    solver.isSolved
    solver.solve()
    solver.isSolved
    print(solver.board)
    
}
