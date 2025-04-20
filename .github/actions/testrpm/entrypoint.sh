#! /bin/bash
set -e

PRINT_VERSION='import bytecode; print("Bytecode version:", bytecode.__version__)'

HELLO_WORLD="
from bytecode import Instr, Bytecode

bytecode = Bytecode([Instr(\"LOAD_GLOBAL\", (True, 'print')),
                     Instr(\"LOAD_CONST\", 'Hello World!'),
                     Instr(\"CALL\", 1),
                     Instr(\"POP_TOP\"),
                     Instr(\"LOAD_CONST\", None),
                     Instr(\"RETURN_VALUE\")])
code = bytecode.to_code()
exec(code)"

PY_VERSIONS=('python3.11' 'python3.12' 'python3.13')

cd /tmp/
rpm -ivh python3*.noarch.rpm

# Test installation, print version, and run hello world
for py in ${PY_VERSIONS[@]}
do
    echo "Test $($py --version)"
    $py -c "$PRINT_VERSION"
    $py -c "$HELLO_WORLD" && echo ""
done
