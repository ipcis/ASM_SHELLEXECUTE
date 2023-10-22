# ASM_SHELLEXECUTE

```
nasm -f win64 your_file.asm -o your_output.obj
link /subsystem:windows /entry:_start your_output.obj /out:your_program.exe

```

hello.asm - console out
```
nasm -f win64 hello.asm -o hello.obj
link /entry:start /subsystem:console hello.obj kernel32.lib
```

hello2.asm - windows messagebox out
```
nasm -f win64 hello2.asm -o hello2.obj
link /entry:start /subsystem:windows /LARGEADDRESSAWARE:NO hello2.obj user32.lib kernel32.lib
```


dropper.asm
```
nasm -f win64 dropper.asm -o dropper.obj
link dropper.obj /subsystem:console /out:dropper.exe kernel32.lib msvcrt.lib legacy_stdio_definitions.lib
https://www.accidentalrebel.com/converting-a-malware-dropper-to-x64-assembly.html
```
