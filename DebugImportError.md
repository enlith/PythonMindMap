Today I was trying to import one module from openstack package but ran into an annoying ImportError rapidly.

I was using virtualenv and tox to setup execution environment for program. And create one wrapper program to invoke shell program main function. 
```python
#!/usr/bin/python
import sys

from shell import main


if __name__ == "__main__":
    sys.exit(main())
```
Then from shell.py, I have code to import module from one openstack package. 

```python

import sys
from oslo_utils import encodeutils

```

When I try to execute that wrapper program, I got error immediately. 
<pre>
ImportError: No module named oslo_utils
</pre>

Then I was suspecting the tox tool did not fix everything correctly for me since I copied tox.ini and changed some parts of it by first imaging.
Then used command "tox --notest -evenv" to get virtualenv installed.  After that, I was actully using virtualenv in tox to setup virtual environment.
There were some errors during tox execution but they were fixed by following those indication of errors. But I still suspected that something hiding was not fixed.
After few try, I decided to try something simplier which is using virtualenv directly without tox. 
There are several steps that I have tried. 
# check and solve virtualenv version problem
pip uninstall virtualenv
pip install virtualenv
virtualenv --version

# create new virtualenv env
deactivate
rmvirtualenv clitest
mkvirtualenv clitest
pip install -r requirements.txt
workon


After played around those steps, the ImportError is still there.
There is one tip on post [Debugging with sys.path / ImportError issues](https://help.pythonanywhere.com/pages/DebuggingImportError/) about checking shadowing of python module.
It is using python interactive mode in your virtual environment. 
I tried to import it in that python interactive mode and got everything works. 
I started to think if it is python version problem, python3 or python2 or something like that. 
Then I looked back that wrapper program and found it specified system path python in first line. 
The wrapper program never used any virtual environment at all since it is system path python. It is only looking for default python path.
OMG!!!
After changed that line to my virtual environment, everything works like charm. 

