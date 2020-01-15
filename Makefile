SRC = $(wildcard ./*.ipynb)
DOCS_PORT = 4010

all: ig_format docs

ig_format: $(SRC)
	nbdev_build_lib
	touch ig_format

docs_serve: docs
	cd docs && bundle exec jekyll serve --port $(DOCS_PORT)

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

release: pypi
	nbdev_bump_version

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist
