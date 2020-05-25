from glob import glob

auto_libs = ''

# Detect the system's endianness
from sys import byteorder
if byteorder == 'big':
	endian = '_NXT_BIG_ENDIAN'
else:
	endian = '_NXT_LITTLE_ENDIAN'

BuildEnv = Environment(CCFLAGS=['-Wall', '-std=gnu99',
				'-g', '-ggdb', '-D' + endian])
if auto_libs:
	BuildEnv.ParseConfig('pkg-config --cflags --libs ' + auto_libs)

BuildEnv.Command('flash_routine.h',
		 'flash_routine.h.base',
		 './make_flash_header.py')

Default(BuildEnv.Library('nxt',
			 [x for x in glob('*.c')
			  if not x.startswith('main_')],
			 LIBS='usb'))

Default(BuildEnv.Program('fwflash', 'main_fwflash.c',
			 LIBS=['usb', 'nxt', 'usb'], LIBPATH='.', LINKFLAGS="--static"))

Default(BuildEnv.Program('fwexec', 'main_fwexec.c',
			 LIBS=['usb', 'nxt', 'usb'], LIBPATH='.', LINKFLAGS="--static"))
