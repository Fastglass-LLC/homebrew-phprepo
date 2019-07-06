require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Swoole < AbstractPhp73Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.4.0.tgz"
  sha256 "90b33cc982ec9b9ac7c160e895ecfdf0cf16b2b52e75dad93c5e51a953821f0e"
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
