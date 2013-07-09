package :cleanup do
  runner "service apache2 restart"
  runner "service ssh restart"
end

