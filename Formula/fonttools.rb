class Fonttools < Formula
  include Language::Python::Virtualenv

  desc "Library for manipulating fonts"
  homepage "https://github.com/fonttools/fonttools"
  url "https://github.com/fonttools/fonttools/releases/download/3.25.0/fonttools-3.25.0.zip"
  sha256 "c1b7eb0469d4e684bb8995906c327109beac870a33900090d64f85d79d646360"
  head "https://github.com/fonttools/fonttools.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "c963abbbddf1cb909d16144f008d22eac5473706fbe006fef3adc93a7686bbfa" => :high_sierra
    sha256 "7576d5051d31693e84ed65ceee390bee6abd6799e100dcc4a9630663552293f9" => :sierra
    sha256 "891bb22ee4117b142f26b7686a2d80c3637389e6c259d7e69462bdababb4d344" => :el_capitan
  end

  option "with-pygtk", "Build with pygtk support for pyftinspect"

  depends_on "python@2" if MacOS.version <= :snow_leopard
  depends_on "pygtk" => :optional

  def install
    virtualenv_install_with_resources
  end

  test do
    cp "/Library/Fonts/Arial.ttf", testpath
    system bin/"ttx", "Arial.ttf"
  end
end
