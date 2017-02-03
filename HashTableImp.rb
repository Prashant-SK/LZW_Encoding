=begin
 //-----------------------------------------

     // 
     // REMARKS: Implement an LZW encription using a Hashtable 
     //
     //
 //-----------------------------------------
=end

=begin
     // CLASS: Hashable
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Hashtable object 
     //
     //-----------------------------------------
=end
class HashTable
  attr_reader :table
  attr_reader :size
  attr_reader :filled
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     size - the size of the hashtable
     //------------------------------------------------------
=end
  def initialize(size)
    @table = Array.new(size)
    @size = size
    @filled = 0
  end
=begin
     //------------------------------------------------------
     // add
     //
     // PURPOSE:    Ads a Hashable object to the table
     // PARAMETERS:
     //     x - the Hashable object to be added
     // RETURNS:
     //     nil
     //------------------------------------------------------
=end
  def add(x)
    index = (x.hashValue) % @size
    if @table[index] == nil
      list = GenericList.new()
      list.insertAtFront(x)
      @table[index] = list
      @filled += 1
    elsif @table[index] != nil 
      list = @table[index] 
      list.insertAtFront(x)
    end
  end
=begin
     //------------------------------------------------------
     // get
     //
     // PURPOSE:    Gets a Hashable object from the table, based on its value/data
     // PARAMETERS:
     //     x - the Hashable object to get
     //------------------------------------------------------
=end
  def get(x)
    if contains?(x) == true
      return (@table[(x.hashValue) % size]).getData(x)
    end
  end
=begin
     //------------------------------------------------------
     // contains?
     //
     // PURPOSE:    Checks to see if a hashable object is in the hashtable
     // PARAMETERS:
     //     x - the Hashable object to search for
     // Returns:
     //     true if object is found
     //------------------------------------------------------
=end  
  def contains?(x)
    index = (x.hashValue) % @size
    list = @table[index] 
    if !(list.nil?)
      return list.find(x)
    else
      return false
    end
  end
=begin
     //------------------------------------------------------
     // isEmpty?
     //
     // PURPOSE:    checks to see if table is empty
     // PARAMETERS:
     //     NONE
     //------------------------------------------------------
=end  
  def isEmpty?
    if @filled == 0
      return true
    else return false
    end
  end
=begin
     //------------------------------------------------------
     // remove?
     //
     // PURPOSE:    Removes a Hashable object from the table
     // PARAMETERS:
     //     x - the Hashable object to be removed
     // RETURNS:
     //     true if object removed successfully
     //------------------------------------------------------
=end  
  def remove(x)
    if((index = (x.hashValue) % @size) != nil)
      list = @table[index]
      if list.delete(x)
        @filled -= 1
        return true
      else 
        return false
      end
    end
  end
  
end #Hashable
 
=begin
     //------------------------------------------------------
     // add
     //
     // PURPOSE:    Ads a Hashable object to the table
     // PARAMETERS:
     //     x - the Hashable object to be added
     //------------------------------------------------------
=end

=begin
// CLASS: Node
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Node Object 
     //
     //-----------------------------------------
=end
class Node 
  
  attr_reader :link 
  attr_reader :theItem
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     item - the data
     //     link - the link to nextNode
     //------------------------------------------------------
=end
  def initialize(item,link)
      @theItem = item
      @link = link
  end

end#Node

=begin
     //------------------------------------------------------
     // CLASS: Hashable
     //
     // AUTHOR: Prashant Shashikumar, 7775162
     //
     // REMARKS:   Abstract class to implement hashValue in all subclasses
     //------------------------------------------------------
=end  
class Hashable 
  def Hashable.new(*args)
    if self == Hashable
      raise "Hashable is an abstract class and cannot be instantiated" 
    else
      super
    end
  end
=begin
     //------------------------------------------------------
     // hashValue
     //
     // PURPOSE:    Abstract function to be implemented in subclasses
     // PARAMETERS:
     //   NONE
     //------------------------------------------------------
=end   
   def hashValue
     raise "Abstract Method Not Implemented in #{self}"
   end
   
end #Hashable

=begin
     // CLASS: GenericList
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: GenericList object (builds a linked list)
     //
     //-----------------------------------------
=end
class GenericList < Hashable
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     size - the size of the hashtable
     //------------------------------------------------------
=end
  def initialize()
     @top = nil
  end
  
=begin
     //------------------------------------------------------
     // find(node)
     //
     // PURPOSE:    Find given node in Linked-List
     // PARAMETERS:
     //   Node - Node to find in Linked-List
     // RETURNS:
     //   true if found
     //------------------------------------------------------
=end   
  def find(node)
    current_node = @top
    while !(current_node.nil?)
      if current_node.theItem==(node)
        return true
      else 
        current_node = current_node.link
      end
    end 
    return false
  end
=begin
     //------------------------------------------------------
     // getData(node)
     //
     // PURPOSE:    Returns the node that matches the paramter node in the Linked-List
     // PARAMETERS:
     //   Node - Node to find a match for in Linked-List
     // RETURNS:
     //   Node object that matches node
     //------------------------------------------------------
=end   
  def getData(node)
    current_node = @top
    while !(current_node.nil?)
      if current_node.theItem==(node)
        return current_node.theItem
      else 
        current_node = current_node.link
      end
    end 
    raise "Element does not exist"
  end
=begin
     //------------------------------------------------------
     // delete(data)
     //
     // PURPOSE:    Deletes a node from the Linked-List
     // PARAMETERS:
     //   data - Node to be deleted
     // RETURNS:
     //   1 if successful, 2 if unsuccessful
     //------------------------------------------------------
=end 
  def delete(data)
      current = @top
      if current.theItem==(data)
          @top = @top.link
          return true
      else
          current = @top
          while !(current.nil?) && (!(current.link).nil?) && (!(current.link==(data)))
              current = current.link
          end 
          if (!current.nil?) && (!(current.link).nil?)
              current.link = (current.link).link
              return true
          end
      end
      return false
  end
=begin
     //------------------------------------------------------
     // insertAtFront
     //
     // PURPOSE:    Create node containing newItem and insert at front of Linked-List
     // PARAMETERS:
     //   newItem - item to be inserted into the new node in the list
     //------------------------------------------------------
=end 
  def insertAtFront(newItem) 
    @top = Node.new(newItem,@top)
  end
end #GenericList

=begin
     // CLASS: IntHash
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Hashable object to manage integers
     //
     //-----------------------------------------
=end
class IntHash < Hashable
   attr_reader :data
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     data - the integer to be stored in the IntHash 
     //------------------------------------------------------
=end
  def initialize(data)
    @data = data
  end
=begin
     //------------------------------------------------------
     // ==(x)
     //
     // PURPOSE:    Check for equality based on data
     // PARAMETERS:
     //   x - Hashable object to compare with
     // RETURNS:
     //   true if equal
     //------------------------------------------------------
=end 
  def ==(x)
    if x.data == @data
      return true
    end
  end 

=begin
     //------------------------------------------------------
     // hashValue
     //
     // PURPOSE:    Calculates the hashvalue of the object
     // PARAMETERS:
     //   NONE
     // RETURNS:
     //   hash value
     //------------------------------------------------------
=end   
  def hashValue()
     return @data
  end
end #IntHash

=begin
     // CLASS: StringHash
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Hashtable object to manage Strings
     //
     //-----------------------------------------
=end
class StringHash < Hashable
   attr_reader :data
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     data - the data to be stores in the StringHash
     //------------------------------------------------------
=end
  def initialize(data)
    @data = data
  end

=begin
     //------------------------------------------------------
     // ==(x)
     //
     // PURPOSE:    Check for equality based on data
     // PARAMETERS:
     //   x - Hashable object to compare with
     // RETURNS:
     //   true if equal
     //------------------------------------------------------
=end   
  def ==(x)
    if x.data == @data
      return true
    end
  end 
=begin
     //------------------------------------------------------
     // hashValue
     //
     // PURPOSE:    Calculates the hashvalue of the object
     // PARAMETERS:
     //   NONE
     // RETURNS:
     //   hash value
     //------------------------------------------------------
=end    
  def hashValue()
    n = data.length
    sum = 0
    p_base = 31
    exponent = 1
    data.each_byte do |c|
      sum += c*(p_base**(n-exponent))
      exponent += 1
    end
    return sum
  end
end #StringHash

=begin
     // CLASS: KeyValueHash
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Hashtable object to manage Key-Value pairs
     //
     //-----------------------------------------
=end
class KeyValueHash < Hashable
  attr_reader :value
  attr_reader :key
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     key - the Hashable key object
     //     data - the number associate with the key
     //------------------------------------------------------
=end
  def initialize(key, data)
    @value = data
    @key = key
  end

=begin
     //------------------------------------------------------
     // ==(x)
     //
     // PURPOSE:    Check for equality based on key's data
     // PARAMETERS:
     //   x - Hashable object to compare with
     // RETURNS:
     //   true if equal
     //------------------------------------------------------
=end   
  def ==(x)
    if x.key.data == @key.data
      return true
    end
  end 
=begin
     //------------------------------------------------------
     // Hashvalue
     //
     // PURPOSE:    Calculates the hashvalue of the object
     // PARAMETERS:
     //   NONE
     // RETURNS:
     //   hash value
     //------------------------------------------------------
=end    
  def hashValue()
     return @key.hashValue()
  end
end #KeyValueHash
