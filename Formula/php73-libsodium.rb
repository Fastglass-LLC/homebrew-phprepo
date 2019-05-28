require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Libsodium < AbstractPhp73Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://pecl.php.net/get/libsodium-2.0.21.tgz"
  sha256 "e4eb31d7541b98b73d90cbf1bf33bb7416890d3025990d528302bc7a502a1feb"
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
