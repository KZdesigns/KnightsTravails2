# KnightsTravails2
In this project we will create a class that will find the shortest path for a Chess Knight from a starting position to an end position. Both the start and end positions should be on a standard 8x8 chess board.

## Take Aways! 

- How to create nodes, trees, and traverse tree data structures using DFS and BFS
- Learning new syntax for write cleaner Ruby code ex:
    ```Ruby
    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
            .reject { |new_pos| @considered_positions.include?(new_pos) }
            .each { |new_pos| @considered_positions << new_pos }
    end
    ```
- Learned have a better understanding when its best to BFS verse DFS