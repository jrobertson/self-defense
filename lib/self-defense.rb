#!/usr/bin/ruby

# file: self-defense.rb

class SelfDefense

  @@hits = [Time.now - 1]

  def initialize(&block)
    super()
    @unit = {s: proc{|x| x}, m: proc{|x| x*60}, h: proc{|x| x*60*60}}
    yield(self)  
  end

  def self.new
    super()
    @@hits << Time.now
  end

  def rapid?(recovery_period=0.8)
    (Time.now - @@hits.last) > recovery_period
  end

  def sustained?(h={})    
    duration = @unit[h[:duration].slice!(-1).to_sym].call(h[:duration])
    @@hits.select {|x| @@hits.last - x <= duration.to_i}.length < h[:hit_limit] + 1
  end

end
