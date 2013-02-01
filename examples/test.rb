class BigMeanGiant
end

# Now add some silly-ish methods, using a flavor of eval.
# They're going to be instance methods, because it's as if
# we defined them inline inside the class definition above.
# When invoked, the giant yells the name of the method.

%w(fee fi fo fum).each do |name|
  BigMeanGiant.class_eval <<-EOS
    def #{name}()
      puts 'Giant says:  #{name.upcase}!'
    end
  EOS
end

# invoke the methods, just for fun
begin
  g = BigMeanGiant.new
  g.fee
  g.fi
  g.fo
  g.fum
end

class Nameclass
end

%w(joel lani benj jonathon).each do |name|
  Nameclass.class_eval <<-EOS
    def #{name}()
      puts name.upcase
    end
  EOS
end

q = Nameclass.new
# q.joel
# q.lani
# q.benj
# q.jonathon
