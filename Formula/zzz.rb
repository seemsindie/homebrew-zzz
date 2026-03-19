class Zzz < Formula
  desc "CLI tool for the Zzz web framework — project scaffolding, dev server, migrations, and more"
  homepage "https://github.com/seemsindie/zzz_cli"
  version "0.2.0-beta.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-aarch64-macos.tar.gz"
      sha256 "bbc76af2feb71630562819b2737ae08ef2cc8bcf18424d502f66d55dff0769f8"
    else
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-x86_64-macos.tar.gz"
      sha256 "2ca54b90bc53b2d83b45c670624046727a64fd0b8a423ffb40c0e8bbeecb930c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-aarch64-linux.tar.gz"
      sha256 "388b36025747855f135b54962ea5ae05f6550a28349d2bd767ac4093823cbd92"
    else
      url "https://github.com/seemsindie/zzz_cli/releases/download/v#{version}/zzz-cli-v#{version}-x86_64-linux.tar.gz"
      sha256 "01bc3718763adc2aa10e5a43f34056c4fb1a22c08b1e49407f7514e2b78821f0"
    end
  end

  def install
    bin.install "zzz"
  end

  test do
    assert_match "zzz", shell_output("#{bin}/zzz --help 2>&1", 0)
  end
end
