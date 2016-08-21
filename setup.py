from setuptools import setup

setup(
    name='iygnohz',
    version='1.0',
    py_modules=['iygnohz'],
    include_package_data=True,
    install_requires=[
        'click',
    ],
    entry_points='''
        [console_scripts]
        iygnohz=iygnohz:cli
    ''',
)
