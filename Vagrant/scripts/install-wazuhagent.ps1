
cd "C:\Windows\Temp"
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.0.2-1.msi -OutFile wazuh-agent.msi
./wazuh-agent.msi /q WAZUH_MANAGER='wazuh.windomain.local' WAZUH_REGISTRATION_SERVER='wazuh.windomain.local'
