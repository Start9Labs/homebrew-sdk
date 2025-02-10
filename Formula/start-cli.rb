class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8bde47bf2df0cae24d8b21c3cf54eb3d9c9f9a16f9f3d6df022aced346ebcee9"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "08b07409cc5e0113237a89c5bab8cd73e058717a493fdb4a75bf1d05b53da410"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe00b428d554beb529589db7bcc9f5a0c75cb18df9c166c06b4218ffb02ee7cd"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4365042de0e8ea17c82058d52858a5b8009d2b677a2f8efd8adc12d05e77dc7"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
