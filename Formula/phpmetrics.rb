require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phpmetrics < AbstractPhpPhar
  init
  desc "Static analysis tool for PHP"
  homepage "http://www.phpmetrics.org"
  url "https://github.com/phpmetrics/PhpMetrics/releases/download/v2.6.2/phpmetrics.phar"
  version "2.6.2"
  sha256 "1d50bb3977638c9f01422998ca02c83d3b8b2d7f715ed2c78653a170d897e8b5"

  test do
    system "phpmetrics", "--version"
  end
end
