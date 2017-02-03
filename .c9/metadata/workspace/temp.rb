{"filter":false,"title":"temp.rb","tooltip":"/temp.rb","undoManager":{"mark":99,"position":99,"stack":[[{"start":{"row":0,"column":0},"end":{"row":56,"column":17},"action":"insert","lines":["# Compress a string to a list of output symbols.","def compress(uncompressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = \"\"","    result = []","    for c in uncompressed.split('')","        wc = w + c","        if dictionary.has_key?(wc)","            w = wc","        else","            result << dictionary[w]","            # Add wc to the dictionary.","            dictionary[wc] = dict_size","            dict_size += 1","            w = c","        end","    end"," ","    # Output the code for w.","    result << dictionary[w] unless w.empty?","    result","end"," ","# Decompress a list of output ks to a string.","def decompress(compressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = result = compressed.shift","    for k in compressed","        if dictionary.has_key?(k)","            entry = dictionary[k]","        elsif k == dict_size","            entry = w + w[0,1]","        else","            raise 'Bad compressed k: %s' % k","        end","        result += entry"," ","        # Add w+entry[0] to the dictionary.","        dictionary[dict_size] = w + entry[0,1]","        dict_size += 1"," ","        w = entry","    end","    result","end"," ","# How to use:","compressed = compress('TOBEORNOTTOBEORTOBEORNOT')","p compressed","decompressed = decompress(compressed)","puts decompressed"],"id":17}],[{"start":{"row":56,"column":17},"end":{"row":57,"column":0},"action":"insert","lines":["",""],"id":18}],[{"start":{"row":57,"column":0},"end":{"row":57,"column":1},"action":"insert","lines":["p"],"id":19}],[{"start":{"row":57,"column":1},"end":{"row":57,"column":2},"action":"insert","lines":["u"],"id":20}],[{"start":{"row":57,"column":2},"end":{"row":57,"column":3},"action":"insert","lines":["t"],"id":21}],[{"start":{"row":57,"column":3},"end":{"row":57,"column":4},"action":"insert","lines":["s"],"id":22}],[{"start":{"row":57,"column":4},"end":{"row":57,"column":5},"action":"insert","lines":[" "],"id":23}],[{"start":{"row":57,"column":5},"end":{"row":57,"column":6},"action":"insert","lines":["1"],"id":24}],[{"start":{"row":57,"column":6},"end":{"row":57,"column":7},"action":"insert","lines":["2"],"id":25}],[{"start":{"row":57,"column":7},"end":{"row":57,"column":8},"action":"insert","lines":["6"],"id":26}],[{"start":{"row":57,"column":8},"end":{"row":57,"column":9},"action":"insert","lines":["."],"id":27}],[{"start":{"row":57,"column":9},"end":{"row":57,"column":10},"action":"insert","lines":["c"],"id":28}],[{"start":{"row":57,"column":10},"end":{"row":57,"column":11},"action":"insert","lines":["h"],"id":29}],[{"start":{"row":57,"column":11},"end":{"row":57,"column":12},"action":"insert","lines":["r"],"id":30}],[{"start":{"row":57,"column":12},"end":{"row":58,"column":0},"action":"insert","lines":["",""],"id":31}],[{"start":{"row":57,"column":12},"end":{"row":58,"column":0},"action":"insert","lines":["",""],"id":32}],[{"start":{"row":58,"column":0},"end":{"row":59,"column":0},"action":"insert","lines":["",""],"id":33}],[{"start":{"row":59,"column":0},"end":{"row":111,"column":13},"action":"insert","lines":["=begin","def comp(uncompressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = \"\"","    result = []","    for c in uncompressed.split('')","        wc = w + c","        if dictionary.has_key?(wc)","            w = wc","        else","            result << dictionary[w]","            # Add wc to the dictionary.","            dictionary[wc] = dict_size","            dict_size += 1","            w = c","        end","    end"," ","    # Output the code for w.","    result << dictionary[w] unless w.empty?","    result","end","","","","def compress(uncompressed)","  dictionary = Dictionary.new()","  for i in 32..126","    dictionary.put(i.chr, i)","  end","  ","  w = \"\"","  result = []","  for c in uncompressed.split('')","      wc = w + c","      if dictionary.contains(KeyValueHash.new(wc,nil))","          w = wc","      else","          result << dictionary.getValue(KeyValueHash(w,nil))","          # Add wc to the dictionary.","          dictionary.put(wc, dict_size)","          dict_size += 1","          w = c","      end","  end","  if !(dictionary.getValue(w)).nil?","    result << dictionary.getValue(w)","  end","  result","end #compress"],"id":34}],[{"start":{"row":52,"column":13},"end":{"row":53,"column":0},"action":"insert","lines":["",""],"id":35}],[{"start":{"row":53,"column":0},"end":{"row":53,"column":1},"action":"insert","lines":["c"],"id":36}],[{"start":{"row":53,"column":1},"end":{"row":53,"column":2},"action":"insert","lines":[" "],"id":37}],[{"start":{"row":53,"column":2},"end":{"row":53,"column":3},"action":"insert","lines":["="],"id":38}],[{"start":{"row":53,"column":3},"end":{"row":53,"column":4},"action":"insert","lines":[" "],"id":39}],[{"start":{"row":53,"column":4},"end":{"row":53,"column":45},"action":"insert","lines":["Array.new(dict_size) {|i| [i.chr, i.chr]}"],"id":40}],[{"start":{"row":53,"column":22},"end":{"row":53,"column":23},"action":"remove","lines":["e"],"id":41}],[{"start":{"row":53,"column":21},"end":{"row":53,"column":22},"action":"remove","lines":["z"],"id":42}],[{"start":{"row":53,"column":20},"end":{"row":53,"column":21},"action":"remove","lines":["i"],"id":43}],[{"start":{"row":53,"column":19},"end":{"row":53,"column":20},"action":"remove","lines":["s"],"id":44}],[{"start":{"row":53,"column":18},"end":{"row":53,"column":19},"action":"remove","lines":["_"],"id":45}],[{"start":{"row":53,"column":17},"end":{"row":53,"column":18},"action":"remove","lines":["t"],"id":46}],[{"start":{"row":53,"column":16},"end":{"row":53,"column":17},"action":"remove","lines":["c"],"id":47}],[{"start":{"row":53,"column":15},"end":{"row":53,"column":16},"action":"remove","lines":["i"],"id":48}],[{"start":{"row":53,"column":14},"end":{"row":53,"column":15},"action":"remove","lines":["d"],"id":49}],[{"start":{"row":53,"column":14},"end":{"row":53,"column":15},"action":"insert","lines":["1"],"id":50}],[{"start":{"row":53,"column":15},"end":{"row":53,"column":16},"action":"insert","lines":["0"],"id":51}],[{"start":{"row":53,"column":38},"end":{"row":54,"column":0},"action":"insert","lines":["",""],"id":52}],[{"start":{"row":54,"column":0},"end":{"row":54,"column":1},"action":"insert","lines":["p"],"id":53}],[{"start":{"row":54,"column":1},"end":{"row":54,"column":2},"action":"insert","lines":["r"],"id":54}],[{"start":{"row":54,"column":2},"end":{"row":54,"column":3},"action":"insert","lines":["i"],"id":55}],[{"start":{"row":54,"column":3},"end":{"row":54,"column":4},"action":"insert","lines":["n"],"id":56}],[{"start":{"row":54,"column":4},"end":{"row":54,"column":5},"action":"insert","lines":["t"],"id":57}],[{"start":{"row":54,"column":5},"end":{"row":54,"column":6},"action":"insert","lines":[" "],"id":58}],[{"start":{"row":54,"column":6},"end":{"row":54,"column":7},"action":"insert","lines":["c"],"id":59}],[{"start":{"row":55,"column":0},"end":{"row":59,"column":12},"action":"remove","lines":["compressed = compress('TOBEORNOTTOBEORTOBEORNOT')","p compressed","decompressed = decompress(compressed)","puts decompressed","puts 126.chr"],"id":60}],[{"start":{"row":57,"column":6},"end":{"row":58,"column":0},"action":"insert","lines":["",""],"id":61}],[{"start":{"row":58,"column":0},"end":{"row":62,"column":12},"action":"insert","lines":["compressed = compress('TOBEORNOTTOBEORTOBEORNOT')","p compressed","decompressed = decompress(compressed)","puts decompressed","puts 126.chr"],"id":62}],[{"start":{"row":62,"column":12},"end":{"row":63,"column":0},"action":"insert","lines":["",""],"id":63}],[{"start":{"row":52,"column":13},"end":{"row":53,"column":0},"action":"insert","lines":["",""],"id":64}],[{"start":{"row":53,"column":0},"end":{"row":53,"column":1},"action":"insert","lines":["d"],"id":65}],[{"start":{"row":53,"column":1},"end":{"row":53,"column":2},"action":"insert","lines":["e"],"id":66}],[{"start":{"row":53,"column":2},"end":{"row":53,"column":3},"action":"insert","lines":["f"],"id":67}],[{"start":{"row":53,"column":3},"end":{"row":53,"column":4},"action":"insert","lines":[" "],"id":68}],[{"start":{"row":53,"column":4},"end":{"row":53,"column":5},"action":"insert","lines":["t"],"id":69}],[{"start":{"row":53,"column":5},"end":{"row":53,"column":6},"action":"insert","lines":["e"],"id":70}],[{"start":{"row":53,"column":6},"end":{"row":53,"column":7},"action":"insert","lines":["s"],"id":71}],[{"start":{"row":53,"column":7},"end":{"row":53,"column":8},"action":"insert","lines":["t"],"id":72}],[{"start":{"row":53,"column":8},"end":{"row":53,"column":9},"action":"insert","lines":["i"],"id":73}],[{"start":{"row":53,"column":9},"end":{"row":53,"column":10},"action":"insert","lines":["n"],"id":74}],[{"start":{"row":53,"column":10},"end":{"row":53,"column":11},"action":"insert","lines":["g"],"id":75}],[{"start":{"row":54,"column":0},"end":{"row":54,"column":4},"action":"insert","lines":["    "],"id":76},{"start":{"row":55,"column":0},"end":{"row":55,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":56,"column":0},"end":{"row":56,"column":1},"action":"insert","lines":["e"],"id":77}],[{"start":{"row":56,"column":1},"end":{"row":56,"column":2},"action":"insert","lines":["n"],"id":78}],[{"start":{"row":56,"column":2},"end":{"row":56,"column":3},"action":"insert","lines":["d"],"id":79}],[{"start":{"row":56,"column":3},"end":{"row":57,"column":0},"action":"insert","lines":["",""],"id":80}],[{"start":{"row":57,"column":0},"end":{"row":57,"column":1},"action":"insert","lines":["t"],"id":81}],[{"start":{"row":57,"column":1},"end":{"row":57,"column":2},"action":"insert","lines":["e"],"id":82}],[{"start":{"row":57,"column":2},"end":{"row":57,"column":3},"action":"insert","lines":["s"],"id":83}],[{"start":{"row":57,"column":3},"end":{"row":57,"column":4},"action":"insert","lines":["t"],"id":84}],[{"start":{"row":57,"column":4},"end":{"row":57,"column":6},"action":"insert","lines":["()"],"id":85}],[{"start":{"row":57,"column":4},"end":{"row":57,"column":6},"action":"remove","lines":["()"],"id":86}],[{"start":{"row":57,"column":3},"end":{"row":57,"column":4},"action":"remove","lines":["t"],"id":87}],[{"start":{"row":57,"column":3},"end":{"row":57,"column":4},"action":"insert","lines":["t"],"id":88}],[{"start":{"row":57,"column":4},"end":{"row":57,"column":5},"action":"insert","lines":["i"],"id":89}],[{"start":{"row":57,"column":5},"end":{"row":57,"column":6},"action":"insert","lines":["n"],"id":90}],[{"start":{"row":57,"column":6},"end":{"row":57,"column":7},"action":"insert","lines":["g"],"id":91}],[{"start":{"row":57,"column":7},"end":{"row":57,"column":9},"action":"insert","lines":["()"],"id":92}],[{"start":{"row":118,"column":0},"end":{"row":118,"column":1},"action":"insert","lines":["="],"id":93}],[{"start":{"row":118,"column":1},"end":{"row":118,"column":2},"action":"insert","lines":["e"],"id":94}],[{"start":{"row":118,"column":2},"end":{"row":118,"column":3},"action":"insert","lines":["n"],"id":95}],[{"start":{"row":118,"column":3},"end":{"row":118,"column":4},"action":"insert","lines":["d"],"id":96}],[{"start":{"row":118,"column":4},"end":{"row":119,"column":0},"action":"insert","lines":["",""],"id":97}],[{"start":{"row":119,"column":0},"end":{"row":119,"column":1},"action":"insert","lines":["e"],"id":98}],[{"start":{"row":119,"column":1},"end":{"row":119,"column":2},"action":"insert","lines":["n"],"id":99}],[{"start":{"row":119,"column":2},"end":{"row":119,"column":3},"action":"insert","lines":["d"],"id":100}],[{"start":{"row":55,"column":11},"end":{"row":57,"column":9},"action":"remove","lines":["","end","testing()"],"id":101}],[{"start":{"row":51,"column":1},"end":{"row":53,"column":11},"action":"remove","lines":["","# How to use:","def testing"],"id":102}],[{"start":{"row":115,"column":2},"end":{"row":115,"column":3},"action":"remove","lines":["d"],"id":103}],[{"start":{"row":115,"column":1},"end":{"row":115,"column":2},"action":"remove","lines":["n"],"id":104}],[{"start":{"row":115,"column":0},"end":{"row":115,"column":1},"action":"remove","lines":["e"],"id":105}],[{"start":{"row":55,"column":0},"end":{"row":55,"column":6},"action":"remove","lines":["=begin"],"id":106}],[{"start":{"row":61,"column":0},"end":{"row":61,"column":6},"action":"insert","lines":["=begin"],"id":107}],[{"start":{"row":52,"column":4},"end":{"row":52,"column":5},"action":"insert","lines":["#"],"id":108}],[{"start":{"row":53,"column":4},"end":{"row":53,"column":5},"action":"insert","lines":["#"],"id":109}],[{"start":{"row":59,"column":0},"end":{"row":59,"column":1},"action":"insert","lines":["#"],"id":110}],[{"start":{"row":0,"column":0},"end":{"row":115,"column":0},"action":"remove","lines":["# Compress a string to a list of output symbols.","def compress(uncompressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = \"\"","    result = []","    for c in uncompressed.split('')","        wc = w + c","        if dictionary.has_key?(wc)","            w = wc","        else","            result << dictionary[w]","            # Add wc to the dictionary.","            dictionary[wc] = dict_size","            dict_size += 1","            w = c","        end","    end"," ","    # Output the code for w.","    result << dictionary[w] unless w.empty?","    result","end"," ","# Decompress a list of output ks to a string.","def decompress(compressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = result = compressed.shift","    for k in compressed","        if dictionary.has_key?(k)","            entry = dictionary[k]","        elsif k == dict_size","            entry = w + w[0,1]","        else","            raise 'Bad compressed k: %s' % k","        end","        result += entry"," ","        # Add w+entry[0] to the dictionary.","        dictionary[dict_size] = w + entry[0,1]","        dict_size += 1"," ","        w = entry","    end","    result","end"," ","    #c = Array.new(10) {|i| [i.chr, i.chr]}","    #print c","","","compressed = compress('TOBEORNOTTOBEORTOBEORNOT')","p compressed","decompressed = decompress(compressed)","#puts decompressed","puts 126.chr","=begin","def comp(uncompressed)","    # Build the dictionary.","    dict_size = 256","    dictionary = Hash[ Array.new(dict_size) {|i| [i.chr, i.chr]} ]"," ","    w = \"\"","    result = []","    for c in uncompressed.split('')","        wc = w + c","        if dictionary.has_key?(wc)","            w = wc","        else","            result << dictionary[w]","            # Add wc to the dictionary.","            dictionary[wc] = dict_size","            dict_size += 1","            w = c","        end","    end"," ","    # Output the code for w.","    result << dictionary[w] unless w.empty?","    result","end","","","","def compress(uncompressed)","  dictionary = Dictionary.new()","  for i in 32..126","    dictionary.put(i.chr, i)","  end","  ","  w = \"\"","  result = []","  for c in uncompressed.split('')","      wc = w + c","      if dictionary.contains(KeyValueHash.new(wc,nil))","          w = wc","      else","          result << dictionary.getValue(KeyValueHash(w,nil))","          # Add wc to the dictionary.","          dictionary.put(wc, dict_size)","          dict_size += 1","          w = c","      end","  end","  if !(dictionary.getValue(w)).nil?","    result << dictionary.getValue(w)","  end","  result","end #compress","=end",""],"id":111}],[{"start":{"row":0,"column":0},"end":{"row":749,"column":0},"action":"insert","lines":["","=begin"," //-----------------------------------------","     // NAME\t\t: Prashant","     // STUDENT NUMBER\t: 7775162","     // COURSE\t\t: COMP 2150","     // INSTRUCTOR\t: Dr. Domaratzki","     // ASSIGNMENT\t: 4","     // QUESTION\t: 1 and 2     ","     // ","     // REMARKS: Implement an LZW encription using a Hashtable ","     //","     //"," //-----------------------------------------","=end","","=begin","     // CLASS: Hashable","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Hashtable object ","     //","     //-----------------------------------------","=end","class HashTable","  attr_reader :table","  attr_reader :size","  attr_reader :filled","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     size - the size of the hashtable","     //------------------------------------------------------","=end","  def initialize(size)","    @table = Array.new(size)","    @size = size","    @filled = 0","  end","=begin","     //------------------------------------------------------","     // add","     //","     // PURPOSE:    Ads a Hashable object to the table","     // PARAMETERS:","     //     x - the Hashable object to be added","     // RETURNS:","     //     nil","     //------------------------------------------------------","=end","  def add(x)","    index = (x.hashValue) % @size","    if @table[index] == nil","      list = GenericList.new()","      list.insertAtFront(x)","      @table[index] = list","      @filled += 1","    elsif @table[index] != nil ","      list = @table[index] ","      list.insertAtFront(x)","    end","  end","=begin","     //------------------------------------------------------","     // get","     //","     // PURPOSE:    Gets a Hashable object from the table, based on its value/data","     // PARAMETERS:","     //     x - the Hashable object to get","     //------------------------------------------------------","=end","  def get(x)","    if contains?(x) == true","      return (@table[(x.hashValue) % size]).getData(x)","    end","  end","=begin","     //------------------------------------------------------","     // contains?","     //","     // PURPOSE:    Checks to see if a hashable object is in the hashtable","     // PARAMETERS:","     //     x - the Hashable object to search for","     // Returns:","     //     true if object is found","     //------------------------------------------------------","=end  ","  def contains?(x)","    index = (x.hashValue) % @size","    list = @table[index] ","    if !(list.nil?)","      return list.find(x)","    else","      return false","    end","  end","=begin","     //------------------------------------------------------","     // isEmpty?","     //","     // PURPOSE:    checks to see if table is empty","     // PARAMETERS:","     //     NONE","     //------------------------------------------------------","=end  ","  def isEmpty?","    if @filled == 0","      return true","    else return false","    end","  end","=begin","     //------------------------------------------------------","     // remove?","     //","     // PURPOSE:    Removes a Hashable object from the table","     // PARAMETERS:","     //     x - the Hashable object to be removed","     // RETURNS:","     //     true if object removed successfully","     //------------------------------------------------------","=end  ","  def remove(x)","    if((index = (x.hashValue) % @size) != nil)","      list = @table[index]","      if list.delete(x) == 1","        @filled -= 1","        return true","      else ","        return false","      end","    end","  end","","  def printIt","    for i in 0..@size-1","      if @table[i] != nil","        @table[i].printIt","      else print \" - \"","      end","    end","    puts","  end","  ","end #Hashable"," ","=begin","     //------------------------------------------------------","     // add","     //","     // PURPOSE:    Ads a Hashable object to the table","     // PARAMETERS:","     //     x - the Hashable object to be added","     //------------------------------------------------------","=end","","=begin","// CLASS: Node","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Node Object ","     //","     //-----------------------------------------","=end","class Node ","  ","  attr_reader :link ","  attr_reader :theItem","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     item - the data","     //     link - the link to nextNode","     //------------------------------------------------------","=end","  def initialize(item,link)","      @theItem = item","      @link = link","  end","","  def printIt","    @theItem.printIt","      if ( @link != nil)","        @link.printIt","      end","  end# printIt","end#Node","","=begin","     //------------------------------------------------------","     // CLASS: Hashable","     //","     // AUTHOR: Prashant Shashikumar, 7775162","     //","     // REMARKS:   Abstract class to implement hashValue in all subclasses","     //------------------------------------------------------","=end  ","class Hashable ","  def Hashable.new(*args)","    if self == Hashable","      raise \"Hashable is an abstract class and cannot be instantiated\" ","    else","      super","    end","  end","=begin","     //------------------------------------------------------","     // hashValue","     //","     // PURPOSE:    Abstract function to be implemented in subclasses","     // PARAMETERS:","     //   NONE","     //------------------------------------------------------","=end   ","   def hashValue","     raise \"Abstract Method Not Implemented in #{self}\"","   end","   ","   def printIt","     raise \"Abstract Method Not Implemented in #{self}\"","   end","   ","end #Hashable","","=begin","     // CLASS: GenericList","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: GenericList object (builds a linked list)","     //","     //-----------------------------------------","=end","class GenericList < Hashable","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     size - the size of the hashtable","     //------------------------------------------------------","=end","  def initialize()","     @top = nil","  end","  ","  def printIt","    if (@top != nil)","      print \"(\"","      @top.printIt","      print \")\"","     else ","      print \" - \"","    end","  end","=begin","     //------------------------------------------------------","     // find(node)","     //","     // PURPOSE:    Find given node in Linked-List","     // PARAMETERS:","     //   Node - Node to find in Linked-List","     // RETURNS:","     //   true if found","     //------------------------------------------------------","=end   ","  def find(node)","    current_node = @top","    while !(current_node.nil?)","      if current_node.theItem==(node)","        return true","      else ","        current_node = current_node.link","      end","    end ","    return false","  end","=begin","     //------------------------------------------------------","     // getData(node)","     //","     // PURPOSE:    Returns the node that matches the paramter node in the Linked-List","     // PARAMETERS:","     //   Node - Node to find a match for in Linked-List","     // RETURNS:","     //   Node object that matches node","     //------------------------------------------------------","=end   ","  def getData(node)","    current_node = @top","    while !(current_node.nil?)","      if current_node.theItem==(node)","        return current_node.theItem","      else ","        current_node = current_node.link","      end","    end ","    raise \"Element does not exist\"","  end","=begin","     //------------------------------------------------------","     // delete(data)","     //","     // PURPOSE:    Deletes a node from the Linked-List","     // PARAMETERS:","     //   data - Node to be deleted","     // RETURNS:","     //   1 if successful, 2 if unsuccessful","     //------------------------------------------------------","=end ","  def delete(data)","      current = @top","      if current.theItem==(data)","          @top = @top.link","          return 1","      else","          current = @top","          while (current != nil) && (current.link != nil) && (!(current.link==(data)))","              current = current.link","          end ","          if (current != nil) && (current.link != nil)","              current.link = (current.link).link","              return 2","          end","      end","  end","=begin","     //------------------------------------------------------","     // insertAtFront","     //","     // PURPOSE:    Create node containing newItem and insert at front of Linked-List","     // PARAMETERS:","     //   newItem - item to be inserted into the new node in the list","     //------------------------------------------------------","=end ","  def insertAtFront(newItem) ","    @top = Node.new(newItem,@top)","  end","end #GenericList","","=begin","     // CLASS: IntHash","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Hashable object to manage integers","     //","     //-----------------------------------------","=end","class IntHash < Hashable","   attr_reader :data","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     data - the integer to be stored in the IntHash ","     //------------------------------------------------------","=end","  def initialize(data)","    @data = data","  end","=begin","     //------------------------------------------------------","     // ==(x)","     //","     // PURPOSE:    Check for equality based on data","     // PARAMETERS:","     //   x - Hashable object to compare with","     // RETURNS:","     //   true if equal","     //------------------------------------------------------","=end ","  def ==(x)","    if x.data == @data","      return true","    end","  end ","  ","  def printIt()","     print \" #{@data} \"","  end ","=begin","     //------------------------------------------------------","     // hashValue","     //","     // PURPOSE:    Calculates the hashvalue of the object","     // PARAMETERS:","     //   NONE","     // RETURNS:","     //   hash value","     //------------------------------------------------------","=end   ","  def hashValue()","     return @data","  end","end #IntHash","","=begin","     // CLASS: StringHash","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Hashtable object to manage Strings","     //","     //-----------------------------------------","=end","class StringHash < Hashable","   attr_reader :data","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     data - the data to be stores in the StringHash","     //------------------------------------------------------","=end","  def initialize(data)","    @data = data","  end","  ","  def printIt()","     print \" #{@data} \"","  end ","=begin","     //------------------------------------------------------","     // ==(x)","     //","     // PURPOSE:    Check for equality based on data","     // PARAMETERS:","     //   x - Hashable object to compare with","     // RETURNS:","     //   true if equal","     //------------------------------------------------------","=end   ","  def ==(x)","    if x.data == @data","      return true","    end","  end ","=begin","     //------------------------------------------------------","     // hashValue","     //","     // PURPOSE:    Calculates the hashvalue of the object","     // PARAMETERS:","     //   NONE","     // RETURNS:","     //   hash value","     //------------------------------------------------------","=end    ","  def hashValue()","    n = data.length","    sum = 0","    p_base = 31","    exponent = 1","    data.each_byte do |c|","      sum += c*(p_base**(n-exponent))","      exponent += 1","    end","    return sum","  end","end #StringHash","","=begin","     // CLASS: KeyValueHash","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Hashtable object to manage Key-Value pairs","     //","     //-----------------------------------------","=end","class KeyValueHash < Hashable","  attr_reader :value","  attr_reader :key","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     key - the Hashable key object","     //     data - the number associate with the key","     //------------------------------------------------------","=end","  def initialize(key, data)","    @value = data","    @key = key","  end","  ","  def printIt()","     print \" [#{@value}, #{@key.data}]\"","  end ","=begin","     //------------------------------------------------------","     // ==(x)","     //","     // PURPOSE:    Check for equality based on key's data","     // PARAMETERS:","     //   x - Hashable object to compare with","     // RETURNS:","     //   true if equal","     //------------------------------------------------------","=end   ","  def ==(x)","    if x.key.data == @key.data","      return true","    end","  end ","=begin","     //------------------------------------------------------","     // Hashvalue","     //","     // PURPOSE:    Calculates the hashvalue of the object","     // PARAMETERS:","     //   NONE","     // RETURNS:","     //   hash value","     //------------------------------------------------------","=end    ","  def hashValue()","     return @key.hashValue()","  end","end #KeyValueHash","","=begin","     // CLASS: Dictionary","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Dictionary object to be used by the Encoder class","     //","     //-----------------------------------------","=end","class Dictionary ","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     NONE","     //------------------------------------------------------","=end ","  def initialize()","    @hashTable = HashTable.new(1000)","  end","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     size - the size of the hashtable","     //------------------------------------------------------","=end  ","  def put(k,v)","    obj = KeyValueHash.new(StringHash.new(k),v)","    if !(@hashTable.contains?(obj))","      @hashTable.add(obj)","    else ","      @hashTable.remove(obj)","      @hashTable.add(obj)","    end","  end","=begin","  def getValue(k)","    obj = KeyValueHash.new(k,v)","    if !(@hashTable.contains(obj))","      raise \"Key not in dictionary\"","    else ","      return (@hashTable.getValue(obj)).data","    end","  end","=end","  def get(k)","    obj = KeyValueHash.new(StringHash.new(k),nil)","    n = @hashTable.get(obj)","    return n.value","  end","  ","  def contains?(x)","    obj = KeyValueHash.new(StringHash.new(x),nil)","    return @hashTable.contains?(obj)","  end","  ","  def isEmpty?","    return @hashTable.isEmpty?","  end","    ","end #Dictionary ","","=begin","     // CLASS: Encode","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Object to encode text from input file and store to output file","     //","     //-----------------------------------------","=end","class Encode","=begin","     //------------------------------------------------------","     // Initializer","     //","     // PURPOSE:    Initializer","     // PARAMETERS:","     //     size - the size of the hashtable","     //------------------------------------------------------","=end","  def initialize(file)","    output = \"\"","    File.open('input.txt','r+') do |f|","      f.each_char do |c|","        output << c","      end","    end","    encode(output)","  end","  ","  def encode(text)","    dictionary = Dictionary.new()","    dict_size = 95","    for i in 32..126","      dictionary.put(i.chr, i-32)","    end","  ","    w = \"\"","    result = []","    for c in text.split('')","        wc = w + c","        if dictionary.contains?(wc)","            w = wc","        else","            result << dictionary.get(w)","            # Add wc to the dictionary.","            dictionary.put(wc, dict_size)","            dict_size += 1","            w = c","        end","    end","    ","    if !(dictionary.get(w)).nil?","      result << dictionary.get(w)","    end","    ","    output = File.open( \"output.lzw\",\"w\" )","    output << \"'#{result.join(\" \")}'\"","    output.close","  end #encode","end","","","=begin","     // CLASS: TestTable","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Run tests on Hashable's functions to see if they work correctly","     //","     //-----------------------------------------","=end","require \"test/unit\"","","class TestTable < Test::Unit::TestCase","  ","  def setup","    @table = HashTable.new(10)","  end","  ","  def test_size","    table = HashTable.new(4)","    assert_equal(table.size, 4)","  end","  ","  def test_isEmpty?","    assert_equal(@table.isEmpty?, true)","    @table.add(IntHash.new(2))","    assert_equal(@table.isEmpty?, false)","  end","  ","  def test_contains?","    @table.add(IntHash.new(2))","    @table.add(StringHash.new(\"a\"))","    @table.add(KeyValueHash.new(StringHash.new(\"b\"), 25))","    assert_equal(@table.contains?(IntHash.new(2)), true)","    assert_equal(@table.contains?(StringHash.new(\"a\")), true)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"b\"), 25)), true)","    assert_equal(@table.contains?(StringHash.new(\"m\")), false)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"m\"), 25)), false)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"b\"), 20)), true)","  end","  ","  def test_add","    @table.add(IntHash.new(2))","    assert_equal(@table.isEmpty?, false)","    assert_equal(@table.filled, 1)","  end","  ","  def test_get","    @table.add(IntHash.new(2))","    @table.add(IntHash.new(7))","    @table.add(StringHash.new(\"char\"))","    assert_equal(@table.get(IntHash.new(7)), IntHash.new(7))","    assert_equal(@table.get(StringHash.new(\"char\")), StringHash.new(\"char\"))","  end","  ","  def test_remove","    @table.add(IntHash.new(2))","    @table.add(IntHash.new(7))","    @table.add(StringHash.new(\"char\"))","    assert_equal(@table.filled, 3)","    assert_equal(@table.remove(IntHash.new(7)), true)","    assert_equal(@table.remove(StringHash.new(\"char\")), true)","    assert_equal(@table.filled, 1)","  end","  ","=begin","  def test_typecheck","    assert_nothing_raised( RuntimeError ) {}","  end","=end","end #Test","","","def test","  Encode.new('input.txt')","end","","test()","","  ","","","","",""],"id":112}],[{"start":{"row":665,"column":0},"end":{"row":736,"column":0},"action":"remove","lines":["","=begin","     // CLASS: TestTable","     //","     // Author: Prashant Shashikumar, 7775162","     //","     // REMARKS: Run tests on Hashable's functions to see if they work correctly","     //","     //-----------------------------------------","=end","require \"test/unit\"","","class TestTable < Test::Unit::TestCase","  ","  def setup","    @table = HashTable.new(10)","  end","  ","  def test_size","    table = HashTable.new(4)","    assert_equal(table.size, 4)","  end","  ","  def test_isEmpty?","    assert_equal(@table.isEmpty?, true)","    @table.add(IntHash.new(2))","    assert_equal(@table.isEmpty?, false)","  end","  ","  def test_contains?","    @table.add(IntHash.new(2))","    @table.add(StringHash.new(\"a\"))","    @table.add(KeyValueHash.new(StringHash.new(\"b\"), 25))","    assert_equal(@table.contains?(IntHash.new(2)), true)","    assert_equal(@table.contains?(StringHash.new(\"a\")), true)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"b\"), 25)), true)","    assert_equal(@table.contains?(StringHash.new(\"m\")), false)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"m\"), 25)), false)","    assert_equal(@table.contains?(KeyValueHash.new(StringHash.new(\"b\"), 20)), true)","  end","  ","  def test_add","    @table.add(IntHash.new(2))","    assert_equal(@table.isEmpty?, false)","    assert_equal(@table.filled, 1)","  end","  ","  def test_get","    @table.add(IntHash.new(2))","    @table.add(IntHash.new(7))","    @table.add(StringHash.new(\"char\"))","    assert_equal(@table.get(IntHash.new(7)), IntHash.new(7))","    assert_equal(@table.get(StringHash.new(\"char\")), StringHash.new(\"char\"))","  end","  ","  def test_remove","    @table.add(IntHash.new(2))","    @table.add(IntHash.new(7))","    @table.add(StringHash.new(\"char\"))","    assert_equal(@table.filled, 3)","    assert_equal(@table.remove(IntHash.new(7)), true)","    assert_equal(@table.remove(StringHash.new(\"char\")), true)","    assert_equal(@table.filled, 1)","  end","  ","=begin","  def test_typecheck","    assert_nothing_raised( RuntimeError ) {}","  end","=end","end #Test",""],"id":113}],[{"start":{"row":664,"column":0},"end":{"row":665,"column":0},"action":"remove","lines":["",""],"id":114}],[{"start":{"row":663,"column":3},"end":{"row":664,"column":0},"action":"remove","lines":["",""],"id":115}],[{"start":{"row":3,"column":1},"end":{"row":8,"column":30},"action":"remove","lines":["    // NAME\t\t: Prashant","     // STUDENT NUMBER\t: 7775162","     // COURSE\t\t: COMP 2150","     // INSTRUCTOR\t: Dr. Domaratzki","     // ASSIGNMENT\t: 4","     // QUESTION\t: 1 and 2    "],"id":116}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":3,"column":1},"end":{"row":3,"column":1},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1486158166304,"hash":"867c7dd2448e56ccdbb96380fd0db86b142ff78c"}