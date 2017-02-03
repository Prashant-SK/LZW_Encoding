
require_relative "HashTableImp"

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
     // put
     //
     // PURPOSE:    Ads a KeyValueHash to the Dictionary
     // PARAMETERS:
     //     k - the key
     //     v - the value
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
=begin
     //------------------------------------------------------
     // get
     //
     // PURPOSE:    Retrives a KeyValueHash from the Dictionary if it exists
     // PARAMETERS:
     //     k - the KeyValueHash to retrieve
     //------------------------------------------------------
=end  
  def get(k)
    obj = KeyValueHash.new(StringHash.new(k),nil)
    n = @hashTable.get(obj)
    return n.value
  end
=begin
     //------------------------------------------------------
     // contains?
     //
     // PURPOSE:    Checks to see if a KeyValueHash is 
     // PARAMETERS:
     //     k - the key
     //     v - the value
     //------------------------------------------------------
=end  
  def contains?(x)
    obj = KeyValueHash.new(StringHash.new(x),nil)
    return @hashTable.contains?(obj)
  end
=begin
     //------------------------------------------------------
     // isEmpty?
     //
     // PURPOSE:    Checks to see if the hashtable is empty
     // PARAMETERS:
     //   NONE
     //------------------------------------------------------
=end    
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
     //     file - the file from which to read from
     //------------------------------------------------------
=end
  def initialize(file)
    @filename = file
    output = ""
    File.open(@filename,'r+') do |f|
      f.each_char do |c|
        output << c
      end
    end
    encode(output)
  end
=begin
     //------------------------------------------------------
     // encode
     //
     // PURPOSE:    Accepts text input, encodes it, and saves it to output file
     // PARAMETERS:
     //     text - text to encode
     //------------------------------------------------------
=end 
  def encode(text)
    dictionary = Dictionary.new()
    dict_size = 95
    
    for i in 32..126
      dictionary.put(i.chr, i-32)              #create dictionary and store values into dictionary
    end
  
    lastKey = ""
    result = []
    for currentKey in text.split('')
        temp = lastKey + currentKey
        if dictionary.contains?(temp)
            lastKey = temp
        else
            result << dictionary.get(lastKey)
            # Add temp to the dictionary.
            dictionary.put(temp, dict_size)   #new pattern will have value of dict_size
            dict_size += 1                    
            lastKey = currentKey
        end
    end
    
    if !(dictionary.get(lastKey)).nil?
      result << dictionary.get(lastKey)
    end
    
    outputFile =  @filename + ".lzw"
    output = File.open(outputFile,"w" )       #Write result to output.lzw
    output << "#{result.join(" ")}"
    output.close
    
  end #encode
  
end
=begin
     //------------------------------------------------------
     // test
     //
     // PURPOSE:    Encode text from input file by calling Encode
     // PARAMETERS:
     //     NONE
     //------------------------------------------------------
=end
def test
  puts "Enter filename: "
  input = ""
  input += gets
  puts input
  Encode.new(input)
end

test()

  




