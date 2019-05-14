require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ds < AbstractPhp72Extension
  init
  desc "Data Structures for PHP"
  homepage "https://github.com/php-ds/extension"
  url "https://pecl.php.net/get/ds-1.2.9.tgz"
  sha256 "7d758d5934e8d46f4f9ca47cb1a399590fa497dbfef828a4d282bdf637a62a70"
  head "https://github.com/php-ds/extension.git"

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"

    prefix.install "modules/ds.so"
    write_config_file if build.with? "config-file"
  end
end
