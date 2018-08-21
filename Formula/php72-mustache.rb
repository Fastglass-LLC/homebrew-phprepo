require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Mustache < AbstractPhp72Extension
  init
  desc "Mustache PHP Extension"
  homepage "https://github.com/jbboehr/php-mustache#mustache"
  url "https://github.com/jbboehr/php-mustache/archive/v0.7.3.tar.gz"
  sha256 "69a6cbe5ae472c0fb1db8979fe0784caeb9d9baace3e13aaa7ab68f0a34dd83e"
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
