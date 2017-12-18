class Alpine < Formula
  desc "News and email agent"
  homepage "http://repo.or.cz/alpine.git"
  url "http://repo.or.cz/alpine.git/snapshot/672d6838a9babf2faeb9f79267525a4ab9d20b14.tar.gz"
  version "2.21"
  sha256 "a74234fce5fb1bfc1f1a19e9d5dabf71414490f544c4cc854f9eb3e78351964d"

  bottle do
    rebuild 1
    sha256 "86c4bb588e6c99a856b665d7643cf8ad699c9add68f7301db804085533480cd8" => :high_sierra
    sha256 "8d0c2b6cd5b91cb904f1ddebe8b5ba27f1c2db50fe26db9a40a8131943abe2b5" => :sierra
    sha256 "a3385e12f96372323504cf50f32b7a045a24e90d0b767ed9be98fdf705d4d65b" => :el_capitan
    sha256 "5b57214d7c4603dea4081f4aa8edee42c148a7daad1ed1fd881d4fb01a28d778" => :yosemite
  end

  depends_on "openssl"

  def install
    ENV.deparallelize

    args = %W[
      --disable-debug
      --with-ssl-dir=#{Formula["openssl"].opt_prefix}
      --with-ssl-certs-dir=#{etc}/openssl
      --prefix=#{prefix}
      --with-passfile=.pine-passfile
    ]

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/alpine", "-supported"
  end
end
