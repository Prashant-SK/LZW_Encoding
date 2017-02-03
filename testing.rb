=begin
     // CLASS: TestTable
     //
     //
     // REMARKS: Run tests on Hashable's functions to see if they work correctly
     //
     //-----------------------------------------
=end
require_relative "HashTableImp"
require_relative "Dictionary"
require "test/unit"

class TestTable < Test::Unit::TestCase
=begin
     //------------------------------------------------------
     // setup
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     NONE
     //------------------------------------------------------
=end
  def setup
    @table = HashTable.new(10)
    @LL    = GenericList.new()
  end
=begin
     //------------------------------------------------------
     // test_size
     //
     // PURPOSE:  Test for the size of the Table
     //------------------------------------------------------
=end  
  def test_size
    table = HashTable.new(4)
    assert_equal(table.size, 4)
  end
=begin
     //------------------------------------------------------
     // test_isEmpty?
     //
     // PURPOSE:  Test for Empty List
     //------------------------------------------------------
=end   
  def test_isEmpty?
    assert_equal(@table.isEmpty?, true)
    @table.add(IntHash.new(2))
    assert_equal(@table.isEmpty?, false)
  end
=begin
     //------------------------------------------------------
     // test_contains?
     //
     // PURPOSE:  Test the table to check if it contains various Hashable objects
     //------------------------------------------------------
=end  
  def test_contains?
    @table.add(IntHash.new(2))
    @table.add(StringHash.new("a"))
    @table.add(KeyValueHash.new(StringHash.new("b"), 25))
    assert_equal(@table.contains?(IntHash.new(2)), true)
    assert_equal(@table.contains?(StringHash.new("a")), true)
    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new("b"), 25)), true)
    assert_equal(@table.contains?(StringHash.new("m")), false)
    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new("m"), 25)), false)
    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new("b"), 20)), true)
  end
=begin
     //------------------------------------------------------
     // test_add
     //
     // PURPOSE:  Test if table can add Hashable objects
     //------------------------------------------------------
=end   
  def test_add
    @table.add(IntHash.new(2))
    assert_equal(@table.isEmpty?, false)
    assert_equal(@table.filled, 1)
  end
=begin
     //------------------------------------------------------
     // test_get
     //
     // PURPOSE:  Test the get function of the table
     //------------------------------------------------------
=end   
  def test_get
    @table.add(IntHash.new(2))
    @table.add(IntHash.new(7))
    @table.add(StringHash.new("char"))
    assert_equal(@table.get(IntHash.new(7)), IntHash.new(7))
    assert_equal(@table.get(StringHash.new("char")), StringHash.new("char"))
  end
=begin
     //------------------------------------------------------
     // test_remove
     //
     // PURPOSE:  Test if table can successfully remove items from it
     //------------------------------------------------------
=end   
  def test_remove                                 
    @table.add(IntHash.new(2))
    @table.add(IntHash.new(7))
    @table.add(StringHash.new("char"))
    assert_equal(@table.filled, 3)
    assert_equal(@table.remove(IntHash.new(7)), true)
    assert_equal(@table.remove(StringHash.new("char")), true)
    assert_equal(@table.filled, 1)                  # Number of items in table should be 1
  end
=begin
     //------------------------------------------------------
     // test_node
     //
     // PURPOSE:  Test for basic Linked List functions such as insert, find, remove
     //------------------------------------------------------
=end 
  def test_node
    @LL.insertAtFront(IntHash.new(8))               #Insert to List
    assert_equal(@LL.find(IntHash.new(8)), true)    #Find in List
    assert_equal(@LL.delete(IntHash.new(8)), true)  #delete item from List
  end
  
end #Test

