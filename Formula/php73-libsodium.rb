require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Libsodium < AbstractPhp73Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "https://pecl.php.net/get/libsodium-2.0.22.tgz"
  sha256 "c302a8b1527f2b0b08110122191c7363d28479291411c94494619bc313c33b95"
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
