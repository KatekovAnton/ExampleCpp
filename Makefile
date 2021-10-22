
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))



.PHONY: docker_build
docker_build:
	docker build . --tag example_cpp



.PHONY: app_clean
app_clean:
	rm -rf build && \
	mkdir -p build

.PHONY: app_configure_vs
app_configure_vs:
	mkdir -p build && \
	cd build && \
	cmake -G "Visual Studio 16 2019" -T host=x64 -A x64 ..

.PHONY: app_configure_ninja
app_configure_ninja:
	mkdir -p build && \
	cd build && \
	cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -G Ninja ..

.PHONY: app_configure_simple
app_configure_simple:
	mkdir -p build && \
	cd build && \
	cmake ..

.PHONY: app_configure_mac
app_configure_mac:
	mkdir -p buildXC && \
	cd buildXC && \
	cmake -G Xcode ..

.PHONY: app_build
app_build:
	cd build && \
	cmake --build . --config Debug --target ExampleCpp

.PHONY: app_run_linux
app_run_linux:
	cd build/ && ./ExampleCpp

.PHONY: configure_docker
configure_docker:
	docker run -v $(ROOT_DIR):$(ROOT_DIR) --rm --workdir $(ROOT_DIR) example_cpp make configure_simple
