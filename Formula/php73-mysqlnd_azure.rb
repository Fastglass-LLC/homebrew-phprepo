require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Mustache < AbstractPhp73Extension
  init
  desc "MySQLnd redirection extension for Azure"
  homepage "https://github.com/microsoft/mysqlnd_azure"
  url "https://pecl.php.net/get/mysqlnd_azure-1.0.0.tgz"
  sha256 "490fb739fa41c019d542226e8e7a8178b0bea3c5e4ef2c6d22a4ca6505035a9f"
  head "https://github.com/microsoft/mysqlnd_azure.git"



  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/mysqlnd_azure.so"
    write_config_file if build.with? "config-file"
  end
end
