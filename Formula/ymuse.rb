require_relative "../lib/go"

class Ymuse < Formula
	desc "Ymuse is an easy, functional, and snappy GTK "
		 "front-end (client) for Music Player Daemon written in Go. "
		 "It supports both light and dark desktop theme."
	homepage "https://yktoo.com/en/software/ymuse/"
	url "https://github.com/yktoo/ymuse/archive/refs/tags/v0.22.tar.gz"
	sha256 "82c0850bbe7e2d9ce227284e167e091c497fffc9f5b80f84132305a4f360ec32"
	head "https://github.com/yktoo/ymuse.git", branch: "dev"

	depends_on "go@1.21" => :build
	depends_on "gettext" => :build
	depends_on "cairo"
	depends_on "gtk+3"

	def install
		system "go", "generate"
		system "go", "build"
		mkdir_p "#{bin}"
		mkdir_p "#{bin}/../share/icons"
		mkdir_p "#{bin}/../share/locale"
		system "cp", "./ymuse", "#{bin}"
		system "cp", *ymuse_install_icons_args
		system "cp", *ymuse_install_docs_args
	end

	def post_install
		system "gtk-update-icon-cache", HOMEBREW_PREFIX/share/icons/hicolor
	end
end
