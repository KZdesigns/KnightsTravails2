require_relative 'tree_node'

class KnightPathFinder
    attr_accessor :start_pos

    MOVES = [
        [1,   2],
        [1,  -2],
        [2,   1],
        [2,  -1],
        [-1,  2],
        [-1, -2],
        [-2,  1],
        [-2, -1]
    ]


    def self.valid_moves(pos)
        valid_moves = []
        cur_x, cur_y = pos
    
        MOVES.each do |mx, my|
            coords = [cur_x + mx, cur_y + my]
            valid_move = coords.all? { |coord| coord.between?(0,7)  }
            if valid_move
                valid_moves << coords
            end
        end
    
        valid_moves
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]

        build_move_tree
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
            .reject { |new_pos| @considered_positions.include?(new_pos) }
            .each { |new_pos| @considered_positions << new_pos }
    end


    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)

        nodes = [root_node]
        until nodes.empty?
            node = nodes.shift

            current_pos = node.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def find_path

    end

end





