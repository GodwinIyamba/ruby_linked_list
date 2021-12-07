require 'pry-byebug'

class LinkedList
    attr_reader :list
    def initialize
        @head = nil
        @tail = nil
        @list = []
    end

    def append(value)
        if @head == nil && @tail == nil
            @head = value
            @tail = value
            @list.unshift(value)
        else
            value.next_node = @head
            @head = value
            @list.unshift(value)
        end
    end

    def prepend(value)
        if @head == nil && @tail == nil
            @head = value
            @tail = value
        else
            @tail.next_node = value
            @tail = value
            @list.push(@tail)
        end
    end

    def size
        @list.size
    end

    def head
        @list.first
    end

    def tail
        @list.last
    end

    def at(index)
        @list[index]
    end

    def pop
        @list.pop
        return @list
    end

    def contains?(value)
        result = @list.map do |child| 
            child.value == value ? true : false
        end
        result.any? {|element| element == true}
    end

    def find(value)
        @list.each_with_index do |child, idx| 
            if child.value == value
                return idx
            end
        end
    end

    def to_s
        @list = @list.map {|val| val.to_s}
    end

    def insert_at(value, index)
        puts 'Index out of range' if index > @list.size
        if index == 0
            append(value)
        elsif(index + 1 == @list.size)
            prepend(value)
        else
            current = @list[index]
            value.next_node = current.next_node
            current.next_node = value
            @list.insert(value, index)
        end
    end

    def remove_at(index)
        puts 'Index out of range' if index > @list.size
        current = @list[index]
        previous = @list[index - 1]
        previous.next_node = current.next_node
        @list.delete_at(index)
        @list
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

