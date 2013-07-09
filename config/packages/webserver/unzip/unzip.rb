package :unzip do
  apt 'unzip'

  verify { has_apt 'unzip' }
end
