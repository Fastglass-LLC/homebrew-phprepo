require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php74Swoole < AbstractPhp74Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.5.7.tgz"
  sha256 "a6fada79611191c021f698265c5651c0566db6cda705f29e8bdb5a99c4c95008"
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
