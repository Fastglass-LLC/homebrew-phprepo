require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Mongodb < AbstractPhp72Extension
  init
  desc "MongoDB driver for PHP."
  homepage "https://pecl.php.net/package/mongodb"
  url "https://pecl.php.net/get/mongodb-1.5.3.tgz"
  sha256 "8def2c74aa28e64839dee4b878bc92ad9164a45d84f55b519ac92f338ff8e1ba"
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
