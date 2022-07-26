
class Composer < Formula
  desc "Dependency Manager for PHP"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/1.10.15/composer.phar"
  sha256 "a69df12e86a0a18fbedfc91a33d5f9acc5cf939576e0258326074fc1b2ee1aea"
  license "MIT"

  livecheck do
    url "https://github.com/composer/composer.git"
    regex(/^[\d.]+$/i)
  end

  def install
    bin.install "composer.phar" => "composer"
  end
end