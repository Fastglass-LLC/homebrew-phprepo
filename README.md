# Homebrew PHP

A centralized repository for PHP-related brews.

This is a fork of the original Homebrew PHP repository that was depreciated by the Homebrew project. PHP
modules must now be installed with PECL or compiling from source. This repo is being maintained because it allows
you to install PHP modules as a package which some people prefer and was the motivation for maintaining this
fork.

Contributions are always welcome, we attempt to keep everything up-to-date as much as possible.

## Notice
PHP 7.1 is not being maintained and the formulas will be deleted.

## Requirements

* [Homebrew](https://github.com/Homebrew/brew)
* High Sierra or Mojave. Untested everywhere else.

## Installation

Run the following in your command-line:

```sh
$ brew tap Fastglass-LLC/homebrew-phprepo
```

## Bugs happen

The more information you provide and the more detailed your report is, the easier it is for us to fix it.
An example of the best practice(s) for filling out bug reports can be seen here: https://github.com/Homebrew/homebrew-php/issues/1225.

Please refer to [this section](#filing-bug-reports) for more information.

## Common Issues

Bugs inevitably happen - none of us are running EVERY conceivable setup - but hopefully the install process can be made smoother through the following tips:

- If you have recently upgraded your macOS version or Xcode, read [this section](#common-upgrade-issues).
- Upgrade your macOS to the latest patch version. So if you are on `10.13.0`, upgrade to `10.13.1` etc.
- Ensure Xcode is installed and up to date.
- Run `brew update`. If you tapped an old version of `homebrew-php` or have an old brew installation, this may cause some installation issues.
- Run `brew upgrade`. This will upgrade all installed formulae. Sometimes an old version of a formula is installed and this breaks our dependency management. Unfortunately, there is currently no way to force Homebrew to upgrade only those we depend upon. This is a possible fix for those with `libxml` related compilation issues.
- If `brew doctor` complains about `Error: Failed to import: homebrew-php-requirement` or similar, you can find broken PHP requirement files using `find $(brew --prefix)/Library/Formula -type l -name "*requirement.rb"`. Run this with the `-delete` flag if you are sure the results of the find contain only the files producing import failures. You can also remove them manually.
- Delete your `~/.pearrc` file before attempting to install a `PHP` version, as the pear step will fail if an existing, incompatible version exists. We try to detect and remove them ourselves, but sometimes this fails.
- Run `brew doctor` and fix any issues you can.
- If you upgraded to High Sierra `10.13.x`, please also upgrade to the latest Xcode, 9.1.
- File an awesome bug report, using the information in the next section.
- If you have a failing install due to `GD build test failed`, try running the following before attempting to reinstall:
- Mojave; XCode no longer installs needed headers, run `open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg`

```sh
brew rm freetype jpeg libpng gd zlib
brew install freetype jpeg libpng gd zlib
```

Doing all of these might be a hassle, but will more than likely ensure you either have a working install or get help as soon as possible.

## zlib Hell

For Catalina (10.15) the compile headers are not installed in Xcode command line utilities. A threat that Apple has made
good on. For 10.15, you must perform some trickery to get the headers available for commandline tools. Try the following:

```export CPATH=`xcrun --show-sdk-path`/usr/include```

For Mojave (10.14), if you are experiencing the problem with zlib not being found, what I found is Xcode has over-updated itself
and you got to reset. Do the following

```
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```
After install go look for the headers installation package which will be in `/Library/Developer/CommandLineTools/Packages/`

Then install the pkg file like so (substitute the correct pkg file):

```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

## Common upgrade issues

If you have recently upgraded your macOS version or Xcode, you may have some compilation or missing libraries issues. The following information may help you solve most of the problems:

- Ensure you have properly upgraded Command Line Tools depending on your Xcode version.
- Proceed step by step to isolate the responsible formula. If you need to install `php71` and `php71-imagick`, don't do `brew install php71 php71-imagick`. Just do `brew install php71`, ensure everything is working as expected, check the output of `phpinfo()`, restart your Apache server with `sudo apachectl restart`. Then you can install the next formula `brew install php71-imagick`.
- If `php56`, `php70` or `php71` build fails, remove all their dependencies and reinstall the formula. For instance: If `brew install php71` fails, do the following: `brew rm php71 && brew deps php71 | xargs brew rm`. If `brew install php71 --with-gmp` fails, do the following: `brew rm php71 && brew deps php71 --with-gmp | xargs brew rm`. Then reinstall a clean version of the formula: `brew update && brew upgrade && brew install php71`.
- If an extension build fails, try also to remove all its dependencies and reinstall it.
- Sometimes it appears that a formula is not available anymore, do the following: `brew tap --repair`.

### Filing Bug Reports

An example of the best practice(s) for filling out bug reports can be seen here: https://github.com/Homebrew/homebrew-php/issues/1225.

Please include the following information in your bug report:

- macOS Version: eg. 10.13.1, 10.14.4
- Homebrew Version: `brew -v`
- PHP Version in use: stock-apple, homebrew-php stable, homebrew-php devel, homebrew-php head, custom
- Xcode Version: 9.1, 9.0, 8.1, 7 etc.
  - Verify whether you have the `Command Line Tools` installed as well.
- Output of `gcc -v`
- Output of `php -v`
- Installation logs for the formula in question
  - A link to the gist created with `brew gist-logs <formula-you-are-using>` will contain these logs.
  - Or, if `brew gist-logs` is not working:
    - Output of `brew install -v path/to/homebrew-php/the-formula-you-want-to-test.rb --with-your --opts-here` within a [gist](https://gist.github.com). Please append any options you added to the `brew install` command.
    - Output of `brew doctor` within a [gist](https://gist.github.com)

New bug reports will be created with a template of this information for you to fill in.


This will help us diagnose your issues much quicker, as well as find similarities between different reported issues.

## Background

This repository contains **PHP-related** formulae for [Homebrew](https://github.com/Homebrew/brew).

(This replaces the PHP formulae that used to live under [adamv's homebrew-alt repository](https://github.com/adamv/homebrew-alt).)

The purpose of this repository is to allow PHP developers to quickly retrieve working, up-to-date formulae. The mainline Homebrew repositories are maintained by non-php developers, so testing/maintaining PHP-related brews has fallen by the wayside. If you are a PHP developer using Homebrew, please contribute to this repository.

## Usage

**Note:** For a list of available configuration options run:

```sh
$ brew options php72
```

Once the tap is installed, you can install `php71`, `php72`, `php73` or any formulae you might need via:

```sh
$ brew install php72
```

That's it!

Please also follow the instructions from `brew info` at the end of the install to ensure you properly installed your PHP version.

### Installing Multiple Versions

Using multiple PHP versions from `homebrew-php` is pretty straightforward.

If using Apache, you will need to update the `LoadModule` call. For convenience, simply comment out the old PHP version:

If using FPM, you will need to unload the `plist` controlling php, or manually stop the daemon, via your command line:

If you would like to swap the PHP you use on the command line, you should update the `$PATH` variable in either your `.profile`, `.zshrc`, `.bashrc` or `.bash_profile`:

```
# Swapping from PHP 7.1 to PHP 7.2
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php72)/bin:$PATH"
```

Please be aware that you must make this type of change EACH time you swap between PHP `minor` versions. You will typically only need to update the Apache/FPM when upgrading your PHP `patch` version.

### PEAR Extensions

Pear is no longer compiled by default, instead you need to install php with the `--with-pear` option, such as: `brew install php71 --with-pear`.

Please note that all extensions installed with the included `pear` will be installed to the respective php's bin path. For example, supposing you installed `PHP_CodeSniffer` as follows:

```sh
$ pear install PHP_CodeSniffer
```

It would be nice to be able to use the `phpcs` command via command-line, or other utilities. You will need to add the installed php's `bin` directory to your path. The following would be added to your `.bashrc` or `.bash_profile` when running the `php71` brew:

```sh
export PATH="$(brew --prefix php72)/bin:$PATH"
```

Some caveats:

- Remember to use the proper PHP version in that export. So if you installed the `php72` formula, use `php72` instead of `php71` in the export.
- Updating your installed PHP will result in the binaries no longer existing within your path. In such cases, you will need to reinstall the pear extensions. Alternatives include installing `pear` outside of `homebrew-php` or using the `homebrew-php` version of your extension.
- Uninstalling your `homebrew-php` PHP formula will also remove the extensions.

## Contributing

See [Contributing](CONTRIBUTING.md)

## Todo

- [x] Proper PHP Versioning? See issue [#8](https://github.com/homebrew/homebrew-php/issues/8)

## License

See [LICENSE](LICENSE).
