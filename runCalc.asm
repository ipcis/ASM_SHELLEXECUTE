section .data
    ; Definiere eine NULL-terminierte Zeichenfolge, die den Dateinamen (calc.exe) enthält
    file_name db 'calc.exe',0

    ; Definiere eine NULL-terminierte Zeichenfolge, die die Aktion (öffnen) enthält
    verb db 'open',0

section .text
global _start

extern ShellExecuteA

_start:
    ; Rufe ShellExecuteA auf, um calc.exe zu starten
    push 0                      ; hwnd (Fensterhandle, in der Regel 0 für das Hauptfenster)
    push verb                   ; Zeiger auf die Aktion
    push file_name              ; Zeiger auf den Dateinamen
    push 0                      ; Parameter (zusätzliche Argumente, hier nicht verwendet)
    push 0                      ; Arbeitsverzeichnis (hier nicht verwendet)
    push SW_SHOWNORMAL          ; Anzeigemodus

    ; Rufe die Windows-API-Funktion ShellExecuteA auf
    mov rax, qword ShellExecuteA
    call rax

    ; Beenden des Programms
    mov rax, 60                 ; Syscall-Nummer für sys_exit
    xor rdi, rdi                ; Beenden Sie den Status: 0
    syscall

section .idata
    ShellExecuteA dq 0          ; Platzhalter für die Adresse der ShellExecuteA-Funktion
