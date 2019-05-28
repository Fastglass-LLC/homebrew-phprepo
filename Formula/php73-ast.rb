require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ast < AbstractPhp73Extension
  init
  desc "Exposing PHP 7 abstract syntax tree"
  homepage "https://github.com/nikic/php-ast"
  url "https://pecl.php.net/get/ast-1.0.1.tgz"
  sha256 "38a2c7819d52a50e177ca817557113fa3419e13c6c269fee8690f74ac5244749"
  head "https://github.com/nikic/php-ast.git"
  revision 1


  def install
    ir.chdir "ast-#{version}" unless build.head?
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/ast.so"
    write_config_file if build.with? "config-file"
  end
end
