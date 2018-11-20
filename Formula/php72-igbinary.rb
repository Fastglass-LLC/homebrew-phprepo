require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Igbinary < AbstractPhp72Extension
  init
  desc "Igbinary is a replacement for the standard php serializer."
  homepage "https://pecl.php.net/package/igbinary"
  url "https://pecl.php.net/get/igbinary-2.0.8.tgz"
  sha256 "bacbab1172e073b1857dc07a486bfdaca6d60fbed678ce0f4b37cd018ef5b680"
  head "https://github.com/igbinary/igbinary.git"


  depends_on "igbinary" => :build

  def install
    Dir.chdir "igbinary-#{version}" unless build.head?
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/igbinary.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<~EOS
      ; Enable or disable compacting of duplicate strings
      ; The default is On.
      ;igbinary.compact_strings=On

      ; Use igbinary as session serializer
      ;session.serialize_handler=igbinary

      ; Use igbinary as APC serializer
      ;apc.serializer=igbinary
    EOS
  end
end
