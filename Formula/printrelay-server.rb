class PrintrelayServer < Formula
  desc "Cloud print relay server - enables remote printing via REST API"
  homepage "https://github.com/schappim/print-relay"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/schappim/print-relay/releases/download/v1.1.0/printrelay-server-darwin-amd64.tar.gz"
      sha256 "f0a10f8708e4886b11aec0301fcceb81ee12059180eec09b9cc8b23b96889262"

      def install
        bin.install "printrelay-server-darwin-amd64" => "printrelay-server"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/schappim/print-relay/releases/download/v1.1.0/printrelay-server-darwin-arm64.tar.gz"
      sha256 "0fd0dea5b264681f7c48e2b588b107a29724cbc9eec1034de1d8c5979b65cbdf"

      def install
        bin.install "printrelay-server-darwin-arm64" => "printrelay-server"
      end
    end
  end

  def caveats
    <<~EOS
      To start the PrintRelay server, run:

        printrelay-server -port 8080 -api-key "YOUR_API_KEY" -client-key "YOUR_CLIENT_KEY"

      Generate secure keys with:

        openssl rand -hex 32

      For more information, see:
        https://github.com/schappim/print-relay#server-setup
    EOS
  end

  test do
    system "#{bin}/printrelay-server", "-h"
  end
end
