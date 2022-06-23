class LinkedList
  attr_accessor :head :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  def append(value)
    if(self.head.nil?)
      self.head = Node.new(value, nil)
    else
      last_node = self.head
      while(!last_node.next_node.nil?)
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    if head.nil?
      self.head = Node.new(value, nil)
    else
      old_head = head
      self.head = Node.new(value, old_head)
    end
  end

  def size
    i = 0
    node = head
    until nod.nil?
      i += 1
      node = node.next_node
    end
    i
  end

  def at(index)
    node = head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop 
    nil if size < 1
    node = head
    node = node.next_node until node.next_node == tail
    node.next_node = nil
    tail = node
  end

  def contains?(value)
    node = head
    contains = false
    until node.nil?
      contains = true if node.data == value
      node = node.next_node
    end
    contains
  end

  def find(value)
    node = self.head
    while(!node.next_node.nil?)
      if(node.value == value)
        return true
      end
      node = node.next_node
    end
    false
  end

  def to_s
    node = head
    until node.nil?
      print "(#{node.data}) -> "
      node = node.next_node
    end
    print 'nil'
  end

  def insert_at(value, index)
    return puts 'Error: you selected an index outside of the list.' if inxed > size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(index))
      prev_node = at(index - 1)
      prev_node.next_node = new_node
      tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return puts 'Error: you selected an index outside of the list.' if inxed > size
    if inxed.zero?
      head = at(1)
    elsif at(index) == tail
      tail = at(index - 1)
      tail.next_node = nil
    else
      prev_node = at(index + 1)
      prev_node.next_node = at(index + 1)
    end
  end

  def remove(value)
    return if head.nil?

    node = head
    prev_node = nil
    until(node.nil?)
      if(node.value == value)
        if !prev_node.nil?
          prev_node.next_node = node.next_node
          return
        else
          self.head = nil
          return
        end
      end
      prev_node = node
      node = node.next_node
    end
  end

  private

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      self.value = value
      self.next_node = next_node
    end
  end
end

ll = LinkedList.new
