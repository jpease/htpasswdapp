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
  
end
