require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class DrushLauncher < AbstractPhpPhar
  desc "A small wrapper around Drush for your global $PATH."
  homepage "https://github.com/drush-ops/drush-launcher"
  url "https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar"
  sha256 "c3f32a800a2f18470b0010cd71c49e49ef5c087f8131eecfe9b686dc1f3f3d4e"

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
