require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Libsodium < AbstractPhp71Extension
  init
  desc "Modern and easy-to-use crypto library"
  homepage "https://github.com/jedisct1/libsodium-php"
  url "http://pecl.php.net/get/libsodium/2.0.13"
  sha256 "be5fad6bfe309dccc109c5cec2e748157fd4d8da04c4de10971845c405ba703d"
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
