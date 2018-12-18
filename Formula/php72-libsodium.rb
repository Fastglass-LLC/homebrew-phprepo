require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Libsodium < AbstractPhp72Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://pecl.php.net/get/libsodium-2.0.20.tgz"
  sha256 "d26e322803b18adf375118a58ace9104850db72f612ff966eaa9f6bc209820ec"
  head "https://github.com/jedisct1/libsodium-php.git"


  depends_on "libsodium"

  def extension
    "libsodium"
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/libsodium.so"
    write_config_file if build.with? "config-file"
  end
end
