require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ds < AbstractPhp72Extension
  init
  desc "Data Structures for PHP"
  homepage "https://github.com/php-ds/extension"
  url "https://pecl.php.net/get/ds-1.2.8.tgz"
  sha256 "55039a72e155503d71cd46a0ebdef39aa67132d8a35e8bd8945b23a0b9776d7f"
  head "https://github.com/php-ds/extension.git"

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"

    prefix.install "modules/ds.so"
    write_config_file if build.with? "config-file"
  end
end
