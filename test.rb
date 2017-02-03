

=begin
     // CLASS: Dictionary
     //
     // REMARKS: Dictionary object to be used by the Encoder class
     //
     //-----------------------------------------
=end
class Dictionary 
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     NONE
     //------------------------------------------------------
=end 
  def initialize()
    @hashTable = HashTable.new(1000)
  end
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     size - the size of the hashtable
     //------------------------------------------------------
=end  
  def put(k,v)
    obj = KeyValueHash.new(StringHash.new(k),v)
    if !(@hashTable.contains?(obj))
      @hashTable.add(obj)
    else 
      @hashTable.remove(obj)
      @hashTable.add(obj)
    end
  end

  def get(k)
    obj = KeyValueHash.new(StringHash.new(k),nil)
    n = @hashTable.get(obj)
    return n.value
  end
  
  def contains?(x)
    obj = KeyValueHash.new(StringHash.new(x),nil)
    return @hashTable.contains?(obj)
  end
  
  def isEmpty?
    return @hashTable.isEmpty?
  end
    
end #Dictionary 

=begin
     // CLASS: Encode
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Object to encode text from input file and store to output file
     //
     //-----------------------------------------
=end
class Encode
=begin
     //------------------------------------------------------
     // Initializer
     //
     // PURPOSE:    Initializer
     // PARAMETERS:
     //     size - the size of the hashtable
     //------------------------------------------------------
=end
  def initialize(file)
    output = ""
    File.open('input.txt','r+') do |f|
      f.each_char do |c|
        output << c
      end
    end
    encode(output)
  end
  
  def encode(text)
    dictionary = Dictionary.new()
    dict_size = 95
    for i in 32..126
      dictionary.put(i.chr, i-32)
    end
  
    w = ""
    result = []
    for c in text.split('')
        wc = w + c
        if dictionary.contains?(wc)
            w = wc
        else
            result << dictionary.get(w)
            # Add wc to the dictionary.
            dictionary.put(wc, dict_size)
            dict_size += 1
            w = c
        end
    end
    
    if !(dictionary.get(w)).nil?
      result << dictionary.get(w)
    end
    
    output = File.open( "output.lzw","w" )
    output << "'#{result.join(" ")}'"
    output.close
  end #encode
end


=begin
     // CLASS: TestTable
     //
     // Author: Prashant Shashikumar, 7775162
     //
     // REMARKS: Run tests on Hashable's functions to see if they work correctly
     //
     //-----------------------------------------
=end
require "test/unit"

class TestTable < Test::Unit::TestCase
  
  def setup
    @table = HashTable.new(10)
  end
  
  def test_size
    table = HashTable.new(4)
    assert_equal(table.size, 4)
  end
  
  def test_isEmpty?
    assert_equal(@table.isEmpty?, true)
    @table.add(IntHash.new(2))
    assert_equal(@table.isEmpty?, false)
  end
  
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
  
  def test_add
    @table.add(IntHash.new(2))
    assert_equal(@table.isEmpty?, false)
    assert_equal(@table.filled, 1)
  end
  
  def test_get
    @table.add(IntHash.new(2))
    @table.add(IntHash.new(7))
    @table.add(StringHash.new("char"))
    assert_equal(@table.get(IntHash.new(7)), IntHash.new(7))
    assert_equal(@table.get(StringHash.new("char")), StringHash.new("char"))
  end
  
  def test_remove
    @table.add(IntHash.new(2))
    @table.add(IntHash.new(7))
    @table.add(StringHash.new("char"))
    assert_equal(@table.filled, 3)
    assert_equal(@table.remove(IntHash.new(7)), true)
    assert_equal(@table.remove(StringHash.new("char")), true)
    assert_equal(@table.filled, 1)
  end
  
=begin
  def test_typecheck
    assert_nothing_raised( RuntimeError ) {}
  end
=end
end #Test


def test
  Encode.new('input.txt')
end

test()

  




