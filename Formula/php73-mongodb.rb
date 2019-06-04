require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Mongodb < AbstractPhp73Extension
  init
  desc "MongoDB driver for PHP."
  homepage "https://pecl.php.net/package/mongodb"
  url "https://pecl.php.net/get/mongodb-1.5.4.tgz"
  sha256 "128ee762dd5fbf18932e503c1649f89c89bb15936c98f4caf563a15fcb7a410f"
  head "https://github.com/mongodb/mongo-php-driver.git"


  def install
    Dir.chdir "mongodb-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-mongodb-ssl=darwin"
    system "make"
    prefix.install "modules/mongodb.so"
    write_config_file if build.with? "config-file"
  end
end
