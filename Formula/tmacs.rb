class Tmacs < Formula
  desc "Lightweight terminal text editor with Emacs key bindings"
  homepage "https://github.com/gxben/tmacs"
  license "Apache-2.0"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gxben/tmacs/releases/download/v1.0.0/tmacs_1.0.0_darwin_arm64.tar.gz"
      sha256 "185482d97ab3fc2bec6cda15a8bb3c5cd89701e18dff75c7444440a94cfbd100"
    else
      url "https://github.com/gxben/tmacs/releases/download/v1.0.0/tmacs_1.0.0_darwin_amd64.tar.gz"
      sha256 "47e17a0c6a73b28ce7411038ac6825f2ac52aeaa05082157f680723371f89684"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gxben/tmacs/releases/download/v1.0.0/tmacs_1.0.0_linux_arm64.tar.gz"
      sha256 "cb959a4c5d11a5a3bd12163673663b7e1b2c76556d7784b07a6220a9bba2193e"
    else
      url "https://github.com/gxben/tmacs/releases/download/v1.0.0/tmacs_1.0.0_linux_amd64.tar.gz"
      sha256 "c8e4e00cb92f0584ae96ff79dbdfe706b518131c119af060c6a560a43ec574f8"
    end
  end

  def install
    bin.install "tmacs"
    pkgshare.install "init.toml.example"
    doc.install "README.md", "LICENSE"
  end

  def caveats
    <<~EOS
      An example configuration is installed at:
        #{pkgshare}/init.toml.example
      Copy it to ~/.config/tmacs/init.toml to customize tmacs.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmacs --version")
  end
end
