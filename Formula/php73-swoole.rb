require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Swoole < AbstractPhp72Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.3.4.tgz"
  sha256 "9bff7ff57237d672ee9e9e31dc7d8c1dace1b4d76c2d3d3c45a989a541a481ab"
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
