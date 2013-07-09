package :git do
  apt 'git-core'

  verify { has_apt 'git-core' }
end
