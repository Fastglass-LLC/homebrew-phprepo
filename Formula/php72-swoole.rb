require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Swoole < AbstractPhp72Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.4.9.tgz"
  sha256 "7d16ed8509d794c0b1bb393280347c0e6a49380bf194919d48818672c77eab60"
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
