class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBALL = "https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz".freeze
    PHPDBG_CHECKSUM    = {
      :sha256 => "feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd",
    }.freeze
  end
  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.33.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.33".freeze
    PHP_BRANCH      = "PHP-7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "03dda3a3a0c8befc9b381bc9cf4638d13862783fc7b8aef43fdd4431ab85854d",
    }.freeze
  end
  module Php73Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.3.22.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.3.22".freeze
    PHP_BRANCH      = "PHP-7.3".freeze

    PHP_CHECKSUM    = {
        :sha256 => "c790b8172520b2ff773d6cf80774ea0a678a2f16e8ee6b11d68802094448689e",
    }.freeze
  end
  module Php74Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.4.10.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.4.10".freeze
    PHP_BRANCH      = "PHP-7.4".freeze

    PHP_CHECKSUM    = {
        :sha256 => "e90bfc9ed98d24e53b51ffd4eb636cf5cd9d71ed7c6f8e4b6e9981e9882174e7",
    }.freeze
  end
end
