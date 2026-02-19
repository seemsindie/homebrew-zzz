class Zzz < Formula
  desc "CLI tool for the Zzz web framework — project scaffolding, dev server, migrations, and more"
  homepage "https://github.com/seemsindie/zzz_cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-aarch64-macos.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_MACOS_SHA256"
    else
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-x86_64-macos.tar.gz"
      sha256 "PLACEHOLDER_X86_64_MACOS_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-aarch64-linux.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_LINUX_SHA256"
    else
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-x86_64-linux.tar.gz"
      sha256 "PLACEHOLDER_X86_64_LINUX_SHA256"
    end
  end

  def install
    bin.install "zzz"
  end

  test do
    assert_match "zzz", shell_output("#{bin}/zzz --help 2>&1", 0)
  end
end
