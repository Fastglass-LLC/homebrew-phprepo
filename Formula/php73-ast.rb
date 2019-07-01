require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Ast < AbstractPhp73Extension
  init
  desc "Exposing PHP 7 abstract syntax tree"
  homepage "https://github.com/nikic/php-ast"
  url "https://pecl.php.net/get/ast-1.0.2.tgz"
  sha256 "14cf2484fd8e3e7f70f6db27b2dde39b83cbd949637a99144136b9ed7eba833d"
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
