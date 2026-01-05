class PrintrelayServer < Formula
  desc "Cloud print relay server - enables remote printing via REST API"
  homepage "https://github.com/schappim/print-relay"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/schappim/print-relay/releases/download/v1.0.0/printrelay-server-darwin-amd64.tar.gz"
      sha256 "6fb1abd45e08d89365225378d3ce671f11524c66b0f55e8d24f220b0281776e5"

      def install
        bin.install "printrelay-server-darwin-amd64" => "printrelay-server"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/schappim/print-relay/releases/download/v1.0.0/printrelay-server-darwin-arm64.tar.gz"
      sha256 "93b95e3cda6efd7187ef44aeaff58701a0abfe278061c62e8e37d36b84e8b730"

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
