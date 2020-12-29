module Device
  def switch_on
    puts "on"
  end

  def switch_off
    puts "off"
  end
end

module Volume
  def volume_up
    puts "volume up"
  end

  def volume_down
    puts "volume down"
  end
end

module Pluggable
  def plug_in
    puts "plug in"
  end

  def plug_out
    puts "plug out"
  end
end

class CellPhone
  include Device, Volume, Pluggable

  def ring
    puts "ringing"
  end
end

cell = CellPhone.new
cell.plug_in
cell.switch_on
cell.ring
cell.volume_up
cell.volume_down
cell.switch_off
cell.plug_out
