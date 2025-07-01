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
      sha256  "cc12faacd7edd4972ba16941a15c6084a29303609465b0b3ebc16564ce7a3b21"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "85d845feec43191687cfb16783c889e62e3801a1d97aacbc830e1369167da46f"
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
