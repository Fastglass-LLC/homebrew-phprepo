require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Lz4 < AbstractPhp73Extension
  init
  desc "Handles LZ4 de/compression"
  homepage "https://github.com/kjdev/php-ext-lz4"
  url "https://github.com/kjdev/php-ext-lz4/archive/0.3.5.tar.gz"
  sha256 "fcea0792f22e337950682129e72ba07c1fd0b3f72ceae2f5691059def3663b55"
  head "https://github.com/kjdev/php-ext-lz4.git"
  revision 1


  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig

    system "make"
    prefix.install "modules/lz4.so"
    write_config_file if build.with? "config-file"
  end
end
