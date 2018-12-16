require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Libsodium < AbstractPhp72Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://pecl.php.net/get/libsodium-2.0.17.tgz"
  sha256 "29e99b24c4de80c800447f5d5e69352bfec7b11f9fa44fe11aa108f0060f74f0"
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
