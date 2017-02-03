=begin
  ProtectedLists.rb
  
=end

class Node 
  def initialize(initItem,initLink)
      @theItem = initItem
      @link = initLink
  end
  
  def printIt
    @theItem.printIt
      if ( @link != nil)
        @link.printIt
      end
  end# printIt

#Dynamically checking to see that the member exists:
#comment out the ListItem printIt, the printIt above, and the
#CharItem definition further below to test this!
# def printIt
#   if defined?(@theItem.printIt)
#    @theItem.printIt
#      if ( @link != nil)
#        @link.printIt
#      end
#    else
#      raise "abstract method printIt not defined!"
#    end 
#  end
  
end  #Node

class ListItem 
  def ListItem.new(*args)
    if self == ListItem
      raise "ListItem is an abstract class and cannot be instantiated" 
    else
      super
    end
  end
  # make this an abstract method by causing an error if the method isn't implemented
  # in all children - there's no such thing as a compile-time error anymore though!
   def printIt
     raise "Abstract Method Not Implemented in #{self}"
   end

end #ListItem

class IntAtom < ListItem
  def initialize(data)
    @data = data
  end

  def printIt()
     print " #{@data} "
  end

end #IntAtom

class FloatAtom < ListItem
  #like the Java and C++ versions, pretend we have to do something different with
  #int vs. float atoms, because there's no real need for two subclasses here
  def initialize(data)
    @data = data
  end
  
  def printIt()
     print " #{@data} "
  end
end #FloatAtom

#this class doesn't implement our abstract method.
#this method is silly anyway since it just duplicates the previous two!
#remember variable types don't matter!
class CharAtom < ListItem
 def initialize(char)
   @data = char
 end
end

class GenericList < ListItem
  def initialize()
     @top = nil
  end
  
  def printIt
    print "("
    if (@top != nil)
      @top.printIt
    end
    print ")"
  end
  
  def insertAtFront(newItem) 
    @top = Node.new(newItem,@top)
  end
  
end #GenericList

def test
  testList = GenericList.new()
  testList.insertAtFront(IntAtom.new(56))
  testList.insertAtFront(FloatAtom.new(2.3))
  puts "\nTestList is:"
  testList.printIt()

  #build another simple list
  outerList = GenericList.new()
  outerList.insertAtFront(IntAtom.new(123))
# uncomment the following to test the abstract class!
#  outerList.insertAtFront(ListItem.new('blah'))
# insert an instance of a class that doesn't implement the abstract method
#  outerList.insertAtFront(CharAtom.new("c"))

  #insert the 1st list at the start of the 2nd (so that we
  #have a list item that is itself a list!  Then insert
  #another atom
  outerList.insertAtFront(testList)
  outerList.insertAtFront(FloatAtom.new(4.5))
  puts "\nOuterList is:"
  outerList.printIt

  #Now insert another item in the inner list, and see what we get!
  testList.insertAtFront(IntAtom.new(99))
  puts "\nTestList is now:"
  testList.printIt()  
  puts "\nOuterList is now:"
  outerList.printIt
  puts "\nEnd of Processing"
end

test()

