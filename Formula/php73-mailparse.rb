require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Mailparse < AbstractPhp73Extension
  init
  desc "Extension for parsing email messages."
  homepage "https://pecl.php.net/package/mailparse"
  url "https://pecl.php.net/get/mailparse-3.0.4.tgz"
  sha256 "9da0ab0f15323f8265fcfb867f0318ec985b306007cff1f7653cb61e477d563b"
  head "https://github.com/php/pecl-mail-mailparse.git"
  revision 1

  depends_on "pcre"

  def install
    Dir.chdir "mailparse-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/mailparse.so"
    write_config_file if build.with? "config-file"
  end
end
