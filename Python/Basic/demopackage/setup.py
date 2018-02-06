from setuptools import setup, find_packages

setup(
    name='demo',
    version='0.0.1dev',
    author='Chia-Chi Chang',
    author_email='c3h3.tw@gmail.com',
    packages=find_packages(),
    install_requires=["html5lib",
                      "requests",
                      "pyquery",
                      "pandas",
                      "numpy"],
)