class Gitws < Formula
  desc      "Git worktree manager written in Rust"
  homepage  "https://github.com/morooka-akira/gitws"
  license   "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-apple-darwin",
              using: :nounzip
      sha256  "8cf6ed9555a9d9108206047285e22f5469bb456c23c8d654215effeacf75462c"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-apple-darwin",
              using: :nounzip
      sha256  "590894c2323a5bb39b88e6cffcd2690e4e55d3537994406f116085e75dd738fd"
    end
  end

  on_linux do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "4ac3f0c5c6520b5a57e4906323315b39fb1ce781a93a81cf595e6d0b90a5307e"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "8521283cf73991bde43b6c938e829b77e5d057a635906e98facc22bff139688b"
    end
  end

  def install
    chmod "+x", Dir["*"].first
    bin.install Dir["*"].first => "gitws"
  end

  test do
    assert_match "Git workspace management tool", shell_output("#{bin}/gitws --help")
  end
end
