# cmake
.PHONY: build
build:
	cmake -S $(CWD) -B $(TMP)/$(MODULE)
	cmake --build $(TMP)/$(MODULE)
