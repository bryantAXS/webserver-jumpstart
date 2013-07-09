package :htop do
  apt 'htop'

  verify { has_apt 'htop' }
end
