require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Swoole < AbstractPhp73Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.4.6.tgz"
  sha256 "3e8835cc47867557fb4dbfc74522e3951bd15abb6100dd0ad81cf87634926fb9"
  head "https://github.com/swoole/swoole-src.git"


  def install
    Dir.chdir "swoole-#{version}" unless build.head?
    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end
