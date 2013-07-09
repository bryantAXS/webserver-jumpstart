package :add_public_keys do

  if Package.exists?(:public_keys) then

    authorized_keys_file = "/home/deployer/.ssh/authorized_keys"
    key_texts = Array.new
    keys = Package.fetch(:public_keys)
    keys.each_with_index do |key, i|

      key_text = File.open(key).read.lstrip
      key_texts.push key_text
      push_text key_text, authorized_keys_file

    end

    verify do
      key_texts.each do |key_text|
        file_contains "/home/deployer/.ssh/authorized_keys", key_text.slice(0,100)
      end
    end

  end

end



