class PrintrelayClient < Formula
  desc "Cloud print relay client - connects local printers to PrintRelay server"
  homepage "https://github.com/schappim/print-relay"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/schappim/print-relay/releases/download/v1.0.0/printrelay-client-darwin-amd64.tar.gz"
      sha256 "4803c57a5daddd3c3131117dd2393798489d16f87266085b743fb6c802183121"

      def install
        bin.install "printrelay-client-darwin-amd64" => "printrelay-client"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/schappim/print-relay/releases/download/v1.0.0/printrelay-client-darwin-arm64.tar.gz"
      sha256 "b95ada6263f937a92efbeb24f58974da234491dfe91504dc583b8fa48f16b42a"

      def install
        bin.install "printrelay-client-darwin-arm64" => "printrelay-client"
      end
    end
  end

  def caveats
    <<~EOS
      To start the PrintRelay client, run:

        printrelay-client -server "wss://your-server.com/ws" -key "YOUR_CLIENT_KEY"

      The client will discover local printers via CUPS and make them available
      through your PrintRelay server.

      For more information, see:
        https://github.com/schappim/print-relay#client-setup
    EOS
  end

  test do
    system "#{bin}/printrelay-client", "-h"
  end
end
