from distutils.core import setup
import os, sys, glob

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(name="cubetimer",
      scripts=['cubetimer'],
      version='1.0.0',
      maintainer="Gabriel Boehme",
      maintainer_email="m.gabrielboehme@googlemail.com",
      description="CubeTimerQML",
      long_description=read('cubetimer.longdesc'),
      data_files=[('share/applications',['cubetimer.desktop']),
                  ('share/icons/hicolor/64x64/apps', ['cubetimer.png']),
                  ('share/cubetimer/qml', glob.glob('qml/*.qml')), ],)
