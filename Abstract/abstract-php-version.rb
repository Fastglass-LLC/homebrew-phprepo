class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBALL = "https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz".freeze
    PHPDBG_CHECKSUM    = {
      :sha256 => "feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd",
    }.freeze
  end

  module Php71Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.1.23.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.1.23".freeze
    PHP_BRANCH      = "PHP-7.1".freeze

    PHP_CHECKSUM    = {
      :sha256 => "2d79aa86d8f0faa760a712a1d7be50b57838a9770c1dff34020876630c2ecc4b",
    }.freeze
  end

  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.18.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.18".freeze
    PHP_BRANCH      = "PHP-7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "fa1a27b12d1173207e81e798a48d4a7f77ba897f5c5200ac0b5d62aa8b4c4b72",
    }.freeze
  end
  module Php73Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.3.5.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.3.5".freeze
    PHP_BRANCH      = "PHP-7.3".freeze

    PHP_CHECKSUM    = {
        :sha256 => "4380b80ef98267c3823c3416eb05f7729ba7a33de6b3d14ec96013215d62c35e",
    }.freeze
  end
end
