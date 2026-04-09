class Pidgn < Formula
  desc "CLI tool for the Pidgn web framework — project scaffolding, dev server, migrations, and more"
  homepage "https://github.com/seemsindie/pidgn_cli"
  version "0.3.1-beta.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-aarch64-macos.tar.gz"
      sha256 "1ff4f6665ac0becd8f2cd8697063b7bda310da31f0a7912952842ebc20d7097e"
    else
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-x86_64-macos.tar.gz"
      sha256 "c7cb385f664c64cc3c0cdddff5cc12e8fa935405fcce795f0e8d54326ce21702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-aarch64-linux.tar.gz"
      sha256 "1234835911ffd0c094cd16059eabeca6512c4352be32be2ba8defc2aec6ceac0"
    else
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-x86_64-linux.tar.gz"
      sha256 "94f4b48018175ee34e0cff3d8157357633b1c8549884abf71e1bfcd52af40d91"
    end
  end

  def install
    bin.install "pidgn"
  end

  test do
    assert_match "pidgn", shell_output("#{bin}/pidgn --help 2>&1", 0)
  end
end
