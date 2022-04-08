require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class PhpunitAT8 < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "https://phpunit.de"
  url "https://phar.phpunit.de/phpunit-8.5.3.phar"
  sha256 "5556b6dc5971bc2d38c47a04877221562a09cc10d7dbf4fbfff9909b28879616"


  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("#{bin}/phpunitat65 --version").include?(version)
  end
end
