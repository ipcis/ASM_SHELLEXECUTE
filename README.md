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
https://tria.ge/231022-rstkbabd98/static1
https://www.virustotal.com/gui/file/0aef5ff97e743b894b9cac0ab917c8f3d25a7b9065b08612517c534d6efd5e70/detection
```

run Notepad - string av evasion
```
nasm -f win64 runNotepad.asm -o runNotepad.obj
link runNotepad.obj /subsystem:console /out:runNotepad.exe msvcrt.lib shell32.lib user32.lib

https://www.accidentalrebel.com/string-av-evasion-in-x64-assembly-part-2.html
```

helloworld
```
nasm -f win64 helloworld.asm -o helloworld.obj
link helloworld.obj /subsystem:console /out:helloworld.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib

https://learn.microsoft.com/en-us/cpp/assembler/masm/microsoft-macro-assembler-reference?view=msvc-170&viewFallbackFrom=vs-2017
https://stackoverflow.com/questions/64413414/unresolved-external-symbol-printf-in-windows-x64-assembly-programming-with-nasm
```
