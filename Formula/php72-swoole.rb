require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Swoole < AbstractPhp72Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.2.5.tgz"
  sha256 "d1ec03bd493c9058e547b401acdd1ea6ad1a8b4ee57884add711974bc01567ac"
  head "https://github.com/swoole/swoole-src.git"
  revision 1


  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end
