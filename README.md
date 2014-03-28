# The Self Defense gem in action

The example below demonstrates how Bob the Martial Artist can defend himself 10 times in 30 seconds before adopting a different strategy.

    require 'self-defense'

    class MartialArtist
      
      def initialize()

      end

      def defend(manoeuvre={})
        action = ''
        strategy = lambda do |defense|

          coping_with_it = []
          coping_with_it << defense.sustained?(duration: '30s', hit_limit: 10)

          action = coping_with_it.all? ? 'blocked' : 'stop hitting me'
        end

        SelfDefense.new(&strategy) 
        puts Time.now.to_s + ': ' + action.to_s
      end
    end


    bob = MartialArtist.new

    Time.now #=> 2013-08-16 18:42:43 +0100

    bob.defend against: :kick  #=> 2013-08-16 18:42:43 +0100: blocked
    sleep 5

    bob.defend against: :punch #=> 2013-08-16 18:42:48 +0100: blocked
    bob.defend against: :kick  #=> 2013-08-16 18:42:48 +0100: blocked
    sleep 5

    bob.defend against: :push  #=> 2013-08-16 18:42:53 +0100: blocked
    bob.defend against: :punch #=> 2013-08-16 18:42:53 +0100: blocked
    bob.defend against: :kick  #=> 2013-08-16 18:42:53 +0100: blocked
    sleep 5

    bob.defend against: :punch #=> 2013-08-16 18:42:58 +0100: blocked
    bob.defend against: :kick  #=> 2013-08-16 18:42:58 +0100: blocked
    bob.defend against: :kick  #=> 2013-08-16 18:42:58 +0100: blocked
    bob.defend against: :punch #=> 2013-08-16 18:42:58 +0100: blocked
    sleep 5

    bob.defend against: :push  #=> 2013-08-16 18:43:03 +0100: stop hitting me
    Time.now #=> 2013-08-16 18:43:03 +0100
    sleep 25

    bob.defend against: :kick  #=> 2013-08-16 18:43:28 +0100: stop hitting me
    sleep 5

    bob.defend against: :push  #=> 2013-08-16 18:43:35 +0100: blocked
    bob.defend against: :push  #=> 2013-08-16 18:43:40 +0100: blocked

Rapid defense

    require 'self-defense'

    class MartialArtist
      
      def initialize()

      end

      def defend(manoeuvre={})
        action = ''
        strategy = lambda do |defense|

          coping_with_it = []
          coping_with_it << defense.rapid?(2)

          action = coping_with_it.all? ? 'blocked' : 'stop hitting me'
        end

        SelfDefense.new(&strategy) 
        puts Time.now.to_s + ': ' + action.to_s
      end
    end


    bob = MartialArtist.new

    bob.defend against: :kick  #=> 2013-08-16 19:40:58 +0100: blocked
    sleep 1
    bob.defend against: :kick  #=> 2013-08-16 19:40:59 +0100: stop hitting me
    sleep 2
    bob.defend against: :punch #=> 2013-08-16 19:41:01 +0100: blocked
    sleep 1
    bob.defend against: :push  #=> 2013-08-16 19:41:02 +0100: stop hitting me
    sleep 0.5
    bob.defend against: :kick  #=> 2013-08-16 19:41:02 +0100: stop hitting me
    sleep 0.5
    bob.defend against: :punch #=> 2013-08-16 19:41:03 +0100: stop hitting me
    sleep 2
    bob.defend against: :kick  #=> 2013-08-16 19:41:05 +0100: blocked
    sleep 2
    bob.defend against: :kick  #=> 2013-08-16 19:41:07 +0100: blocked
    sleep 2.5
    bob.defend against: :punch #=> 2013-08-16 19:41:09 +0100: blocked
    sleep 2
    bob.defend against: :push  #=> 2013-08-16 19:41:11 +0100: blocked
    sleep 0.5
    bob.defend against: :punch #=> 2013-08-16 19:41:12 +0100: stop hitting me

Sustained and rapid defense together

    require 'self-defense'

    class MartialArtist
      
      def initialize()

      end

      def defend(manoeuvre={})
        action = ''
        strategy = lambda do |defense|

          coping_with_it = []
          coping_with_it << defense.rapid?(1)
          coping_with_it << defense.sustained?(duration: '30s', hit_limit: 7)

          action = coping_with_it.all? ? 'blocked' : 'stop hitting me'
        end

        SelfDefense.new(&strategy) 
        puts Time.now.to_s + ': ' + action.to_s
      end
    end

    bob = MartialArtist.new

    bob.defend against: :kick  #=> 2013-08-16 19:51:58 +0100: stop hitting me
    sleep 1
    bob.defend against: :kick  #=> 2013-08-16 19:51:59 +0100: blocked
    sleep 2
    bob.defend against: :punch #=> 2013-08-16 19:52:01 +0100: blocked
    sleep 1
    bob.defend against: :push  #=> 2013-08-16 19:52:02 +0100: blocked
    sleep 0.5
    bob.defend against: :kick  #=> 2013-08-16 19:52:03 +0100: stop hitting me
    sleep 0.5
    bob.defend against: :punch #=> 2013-08-16 19:52:03 +0100: stop hitting me
    sleep 2
    bob.defend against: :kick  #=> 2013-08-16 19:52:05 +0100: blocked
    sleep 2
    bob.defend against: :kick  #=> 2013-08-16 19:52:07 +0100: blocked
    sleep 2.5
    bob.defend against: :punch #=> 2013-08-16 19:52:10 +0100: stop hitting me
    sleep 2
    bob.defend against: :push  #=> 2013-08-16 19:52:12 +0100: stop hitting me
    sleep 0.5
    bob.defend against: :punch #=> 2013-08-16 19:52:14 +0100: stop hitting me

