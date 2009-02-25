require 'digest/sha1'
require 'base64'

SALT_CHARS = (%w[ . / ] + ("0".."9").to_a + ('A'..'Z').to_a + ('a'..'z').to_a).freeze

class Encoder

  def gen_salt
    chars = []
    8.times { chars << SALT_CHARS[rand(SALT_CHARS.size)] }
    chars.join('')     
  end

  def crypt(password)
    salt = gen_salt
    password.crypt(salt)
  end
  
  def md5(password)

  end

  def sha(password)
    prefix = "{SHA}"
    "#{prefix}#{Base64.encode64(::Digest::SHA1.digest(password)).strip}"
  end
  
end
