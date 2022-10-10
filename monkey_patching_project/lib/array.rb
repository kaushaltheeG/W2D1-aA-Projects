# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        if (self.all? {|ele| ele.integer?})
            self.max - self.min
        end
    end

    def average 
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        self.sort!
        return self[(self.length-1)/2] if self.length.odd?
        (self[self.length/2] + self[(self.length/2)-1]) / 2.0
    end

    def counts
        hash = Hash.new {|h,k| h[k] = 0}
        self.each {|ele| hash.include?(ele) ? hash[ele] = hash[ele]+1 : hash[ele] = 1}
        hash
    end

    def my_count(arg)
        hash = self.counts
        hash[arg] 
    end

    def my_index(arg)
        self.each.with_index {|ele, i| return i if ele == arg}
        nil
    end

    def my_uniq
        uniq = []
        self.each {|ele| uniq << ele if !uniq.include?(ele)}
        uniq
    end

    def my_transpose
        hash_idx = Hash.new {|h,k| h[k] = []}

        self.each do |sub|
            sub.each.with_index do |ele, i|
                hash_idx[i] << ele
            end
        end
        hash_idx.values
    end

end
