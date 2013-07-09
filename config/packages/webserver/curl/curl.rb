package :curl do
  apt 'curl'
  verify { has_apt 'curl' }
end
