class Pidgn < Formula
  desc "CLI tool for the Pidgn web framework — project scaffolding, dev server, migrations, and more"
  homepage "https://github.com/seemsindie/pidgn_cli"
  version "0.3.1-beta.10"
  license "MIT"

  on_macos do
    url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-aarch64-macos.tar.gz"
    sha256 "7997ceda6e2778c6f82a6730948414040f593f153461b255b54a022651a274be"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-aarch64-linux.tar.gz"
      sha256 "aa506e3502fad05ffecea4bd84947bfb70580ea1347bc35767eb80a164bb81ee"
    else
      url "https://github.com/seemsindie/pidgn_cli/releases/download/v#{version}/pidgn-cli-v#{version}-x86_64-linux.tar.gz"
      sha256 "710992c40ad51ba29ecd72c86898f5ec2d7d7da8452113191e55b02ab271dfef"
    end
  end

  def install
    bin.install "pidgn"
  end

  test do
    assert_match "pidgn", shell_output("#{bin}/pidgn --help 2>&1", 0)
  end
end
