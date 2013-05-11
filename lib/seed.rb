timer = Timer.new(
  name:   "Test",
  end:    Date.new(2013, 12, 31)
)

timer2 = Timer.new(
  name:  "Test2", 
  end:   Date.new(2013, 6, 30)
)

timer.save!
timer2.save!