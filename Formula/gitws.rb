class Gitws < Formula
  desc      "Git worktree manager written in Rust"
  homepage  "https://github.com/morooka-akira/gitws"
  license   "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-apple-darwin",
              using: :nounzip
      sha256  "b1ff39df9dddf61c43303be8f8bfae62927ea2782ee7d82bb2dcf3246fdcb71c"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-apple-darwin",
              using: :nounzip
      sha256  "2505d8ecd6d8b01dd560cd496f8b987d2347c3a33175a8b534d335e87934263d"
    end
  end

  on_linux do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "b674cbf97f00676dcaf7d7932dde5ad98d0c75453d6721823c53e0822064ab02"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "3e6d11af7010a715147a3b90feb5aa55d04791e58bfe7236604a4c6e6825a107"
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
