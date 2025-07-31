@ echo off
if exist %1.obj del %1.obj
if exist %1.exe del %1.exe

tasm %1.asm
if exist %1.obj  tlink %1.obj
@ echo on
if exist %1.exe %1.exe