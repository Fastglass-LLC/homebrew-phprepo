require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Lzf < AbstractPhp73Extension
  init
  desc "handles LZF de/compression"
  homepage "https://pecl.php.net/package/lzf"
  url "https://pecl.php.net/get/LZF-1.6.7.tgz"
  sha256 "48178da24401976f8ac518905222af64c033f49f2a50d830e55de13fa80e8fe0"
  head "https://github.com/php/pecl-file_formats-lzf.git"
  revision 1


  def install
    Dir.chdir "LZF-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/lzf.so"
    write_config_file if build.with? "config-file"
  end
end
