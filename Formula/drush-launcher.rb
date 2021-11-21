require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class DrushLauncher < AbstractPhpPhar
  desc "A small wrapper around Drush for your global $PATH."
  homepage "https://github.com/drush-ops/drush-launcher"
  url "https://github.com/drush-ops/drush-launcher/releases/download/0.9.1/drush.phar"
  sha256 "52b5e22031789e087e4f79ac49c74d94c0379ad6859f3ec14671ce1647a3b7a6"

  def phar_file
    "drush.phar"
  end

  def phar_bin
    "drush"
  end

  test do
    system "#{bin}/drush", "--drush-launcher-version"
  end

end
