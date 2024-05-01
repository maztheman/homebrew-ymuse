require "formula"

def ymuse_install_icons_args
	%W[
		-R
		./resources/icons
		#{bin}/../share/
	]
end

def ymuse_install_docs_args
	%W[
		-R
		./resources/i18n/generated/
		#{bin}/../share/locale/
	]
end
