package :build_essential do
  apt 'build-essential'

  verify { has_apt 'build-essential' }
end
