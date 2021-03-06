# coding=utf-8
from setuptools import setup

setup(
    name='pyioc',
    version='0.3.0',
    packages=['pyioc'],
    url='https://github.com/MrUPGrade/pyioc',
    license='MIT',
    author='Jakub (Mr. UPGrade) Czapliński',
    author_email='itsupgradetime@gmail.com',
    description='Python IoC tools.',
    install_requires=[
        'six>=1.9.0',
        'future>=0.15.2',
        'enum34>=1.1.1',
    ],
    extras_require={
        'test': [
            'pytest>=2.8.0',
            'mock>=1.3.0',
            'coverage>=4.0.0'
        ],
        'dev': [
            'ipython',
            'flake8'
        ],
        'doc': [
            'sphinx'
        ]
    },
    classifiers=[
        "Programming Language :: Python :: 2.6",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3.3",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5"
    ]
)
