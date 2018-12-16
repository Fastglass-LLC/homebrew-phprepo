require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Libsodium < AbstractPhp72Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://pecl.php.net/get/libsodium-2.0.19.tgz"
  sha256 "84b6ba249b2c0b8b8d9d083d529f93a54e985d5bd8c499af4f61734eed0e00b9"
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
