require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Swoole < AbstractPhp72Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.2.10.tgz"
  sha256 "f851651730f2e57df7687dcd6bec3cfc30f0f407e176284e378864b84fbe0c94"
  head "https://github.com/swoole/swoole-src.git"


  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end
