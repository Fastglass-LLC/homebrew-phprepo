require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Swoole < AbstractPhp72Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.2.11.tgz"
  sha256 "af2a445b2c6fe2d0f34831de2ee711ae44a7b7deb25da9ef59c84b8ef16a4851"
  head "https://github.com/swoole/swoole-src.git"


  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end
