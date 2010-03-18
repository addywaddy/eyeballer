# Eyeballer

A simple observer written in Ruby.

Observe:

    class Foo

      def save
        "Saved!"
      end

      def whatever
        "Whatever ..."
      end

    end

    class MyObserver
      include Eyeballer

      observe :foo, :save => [:do_something, :do_something_else]
      observe :foo, :whatever => :do_something_else

      def do_something
        "Do something!"
      end

      def do_something_else
      "Do something else!"
      end

    end
    