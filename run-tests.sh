#!/bin/bash
cd /home/runner/work/extends/extends
export OSCRIPT_CONFIG=tests/oscript.cfg
export LIB_SYSTEM=../src
oscript -exec "ПодключитьСценарий(\"../src\", \"extends\"); ПодключитьСценарий(\"tests\", \"extends-tests\");" tests/ВалидаторРеализации.os