from setuptools import setup, find_packages

setup(name='pack',
      version='0.03',
      description='packaging ...',
      author='so',
      #packages=['pack', 'pack/subpack'],
      packages=find_packages(),
      zip_safe=False)
