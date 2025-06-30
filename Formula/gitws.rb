class Gitws < Formula
  desc      "Git worktree manager written in Rust"
  homepage  "https://github.com/morooka-akira/gitws"
  license   "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-apple-darwin",
              using: :nounzip
      sha256  "21a9fa4291a495fc7970b56d45ae9512be68bbb0766a30dd4a89a635efcec041"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-apple-darwin",
              using: :nounzip
      sha256  "b4f45185842d44b8c02ee1b047b6288c551ca59a420e870d951542264fa80b7d"
    end
  end

  on_linux do
    on_arm do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "e9cee0111d0f0fa028aa4b06ec5825cfd8b9630d0e8b4207b698f097eb91c9ad"
    end
    on_intel do
      url     "https://github.com/morooka-akira/gitws/releases/download/v0.1.0/gitws-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "36bae915ff15008a83a37b6b3d128b5b4a416ab2b62bc148cb0be03ec85910d0"
    end
  end

  def install
    chmod "+x", Dir["*"].first
    bin.install Dir["*"].first => "gitws"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/gitws --version")
  end
end
