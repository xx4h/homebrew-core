class Virtualenv < Formula
  include Language::Python::Virtualenv

  desc "Tool for creating isolated virtual python environments"
  homepage "https://virtualenv.pypa.io/"
  url "https://files.pythonhosted.org/packages/d8/02/0737e7aca2f7df4a7e4bfcd4de73aaad3ae6465da0940b77d222b753b474/virtualenv-20.26.0.tar.gz"
  sha256 "ec25a9671a5102c8d2657f62792a27b48f016664c6873f6beed3800008577210"
  license "MIT"
  head "https://github.com/pypa/virtualenv.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "020dbf867b853838ee0c97f758ddb2d1b425da7e6e5a0297c42925f97ae9507f"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "020dbf867b853838ee0c97f758ddb2d1b425da7e6e5a0297c42925f97ae9507f"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "020dbf867b853838ee0c97f758ddb2d1b425da7e6e5a0297c42925f97ae9507f"
    sha256 cellar: :any_skip_relocation, sonoma:         "46b44ceec32c1c5cffc001c6e7bb60b650091e2ab5bd47198f7dec25327be22b"
    sha256 cellar: :any_skip_relocation, ventura:        "46b44ceec32c1c5cffc001c6e7bb60b650091e2ab5bd47198f7dec25327be22b"
    sha256 cellar: :any_skip_relocation, monterey:       "46b44ceec32c1c5cffc001c6e7bb60b650091e2ab5bd47198f7dec25327be22b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7baf12fa6493d9f4019ddabed18f4373550077302060bcc6c89608896a61cd33"
  end

  depends_on "python@3.12"

  resource "distlib" do
    url "https://files.pythonhosted.org/packages/c4/91/e2df406fb4efacdf46871c25cde65d3c6ee5e173b7e5a4547a47bae91920/distlib-0.3.8.tar.gz"
    sha256 "1530ea13e350031b6312d8580ddb6b27a104275a31106523b8f123787f494f64"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/38/ff/877f1dbe369a2b9920e2ada3c9ab81cf6fe8fa2dce45f40cad510ef2df62/filelock-3.13.4.tar.gz"
    sha256 "d13f466618bfde72bd2c18255e269f72542c6e70e7bac83a0232d6b1cc5c8cf4"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/b2/e4/2856bf61e54d7e3a03dd00d0c1b5fa86e6081e8f262eb91befbe64d20937/platformdirs-4.2.1.tar.gz"
    sha256 "031cd18d4ec63ec53e82dceaac0417d218a6863f7745dfcc9efe7793b7039bdf"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"virtualenv", "venv_dir"
    assert_match "venv_dir", shell_output("venv_dir/bin/python -c 'import sys; print(sys.prefix)'")
  end
end
