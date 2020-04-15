require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class PhpunitAT7 < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "https://phpunit.de"
  url "https://phar.phpunit.de/phpunit-7.5.9.phar"
  sha256 "5404288061420c3921e53dd3a756bf044be546c825c5e3556dea4c51aa330f69"

  bottle :unneeded

  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("#{bin}/phpunit --version").include?(version)
  end
end
