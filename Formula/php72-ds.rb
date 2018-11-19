require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ds < AbstractPhp72Extension
  init
  desc "Data Structures for PHP"
  homepage "https://github.com/php-ds/extension"
  url "https://pecl.php.net/get/ds-1.2.7.tgz"
  sha256 "607a52d694eb6484086b0782e759df340363338ac2646966aac32d263a4ee81c"
  head "https://github.com/php-ds/extension.git"

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"

    prefix.install "modules/ds.so"
    write_config_file if build.with? "config-file"
  end
end
