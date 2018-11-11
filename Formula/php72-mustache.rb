require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Mustache < AbstractPhp72Extension
  init
  desc "Mustache PHP Extension"
  homepage "https://github.com/jbboehr/php-mustache#mustache"
  url "https://pecl.php.net/get/mustache-0.8.0.tgz"
  sha256 "9f83f3be1f6cb2bb52cf74b40458605ae02611119e312e5a3e31ffe75c3f90e7"
  head "https://github.com/jbboehr/php-mustache.git"


  depends_on "libmustache"

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/mustache.so"
    write_config_file if build.with? "config-file"
  end
end
