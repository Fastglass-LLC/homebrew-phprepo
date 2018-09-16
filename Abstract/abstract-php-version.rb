class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBALL = "https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz".freeze
    PHPDBG_CHECKSUM    = {
      :sha256 => "feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd",
    }.freeze
  end

  module Php71Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.1.21.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.1.21".freeze
    PHP_BRANCH      = "PHP-7.1".freeze

    PHP_CHECKSUM    = {
      :sha256 => "c2409c574bde23763b48a96b93922f530156df044585ff60108bce7b27b19580",
    }.freeze
  end

  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.9.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.9".freeze
    PHP_BRANCH      = "PHP-7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "e9e3aaa6c317b7fea78246a758b017544366049d2789ad5a44fe9398464c53a8",
    }.freeze
  end
end
