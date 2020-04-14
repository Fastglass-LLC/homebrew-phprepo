class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBALL = "https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz".freeze
    PHPDBG_CHECKSUM    = {
      :sha256 => "feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd",
    }.freeze
  end
  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.28.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.28".freeze
    PHP_BRANCH      = "PHP-7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "7c953a5b79db3d8d45c65014aef382a48e1c3435cf0c2574e942957f0cdd52a3",
    }.freeze
  end
  module Php73Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.3.15.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.3.15".freeze
    PHP_BRANCH      = "PHP-7.3".freeze

    PHP_CHECKSUM    = {
        :sha256 => "8dbe1507ea0035f4211faa0db80fe95f39df0e39d8408223820fe9123487043d",
    }.freeze
  end
  module Php74Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.4.3.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.4.3".freeze
    PHP_BRANCH      = "PHP-7.4".freeze

    PHP_CHECKSUM    = {
        :sha256 => "c1517ba49578fb2dcc64c73a3edc76d4fc507c4a7ac639981584cc7d3b4c6d14",
    }.freeze
  end
end
