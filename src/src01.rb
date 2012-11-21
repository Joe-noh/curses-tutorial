#-*- coding: utf-8 -*-

require "curses" # MUST

module CursesModule

  # Fundamental Use
  def fund00
    Curses.init_screen  # Initialization. Unnecessary?
    Curses.addstr "Hello, Curses."
    Curses.refresh      # Required to Display
    Curses.getch        # Mini Stop
    Curses.close_screen # Close. Unnecessary too?
  end

  # Set Position
  def fund01
    Curses.init_screen
    Curses.setpos 5, 10 # 5th Row, 10th Column
    Curses.addstr "Hello, Curses."
    Curses.doupdate     # Better than Curses#refresh
    Curses.setpos 8, 14 # 8th Row, 14th Column
    Curses.addstr "Goodbye, Curses."
    Curses.doupdate
    Curses.getch        # Mini Stop
    Curses.close_screen
  end
end

if __FILE__ == $0
  obj = Object.new.extend CursesModule
  methods_num = (obj.methods - Object.new.methods).size

  methods_num.times do |i|
    obj.send ("fund%02d"%i).to_sym
  end
end
