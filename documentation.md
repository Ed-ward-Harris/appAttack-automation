## About  

The AppAttack Toolkit is a comprehensive penetration testing and secure coding tool that runs in your terminal. Each tool has a step by step guide. The toolkit can also perform an automated web app vulnerability scan. For each tool you can get insights from our ai that will explain the output.  

---
  
**The toolkit incorporates many different tools:** 
### Penetration Testing Tools 
- [nmap](https://nmap.org/) Network exploration and security auditing tool
- [nikto](https://github.com/sullo/nikto/tree/master) Web server scanner
- [LEGION](https://github.com/Abacus-Group-RTO/legion) Automated web application security scanner
- [OWASP ZAP](https://www.zaproxy.org/) Web application security testing tool
- [John the Ripper](https://www.openwall.com/john/) Password cracking tool
- [SQLmap](https://sqlmap.org/) SQL Injection and database takeover tool
- [metasploit](https://www.metasploit.com/) Penetration testing framework
- [Wapiti](https://wapiti-scanner.github.io/) Web Application Vulnerability Scanner

### Secure Coding Tools
- [osv-scanner](https://github.com/google/osv-scanner) Scan a directory for vulnerabilities  
- [snyk cli](https://snyk.io/) Test code locally or monitor for vulnerabilities    
- [brakeman](https://brakemanscanner.org/) Scan a Ruby on Rails application for security vulnerabilities
- [bandit](https://bandit.readthedocs.io/en/latest/) Security linter for Python code
- [SonarQube](https://www.sonarsource.com/products/sonarqube/) Continuous inspection of code quality and security   

### IoT Penetration Testing Tools
- [Aircrack-ng](https://www.aircrack-ng.org/): A suite of tools for monitoring, attacking, testing, and cracking Wi-Fi networks.
- [Bettercap](https://www.bettercap.org/): A powerful, flexible, and portable tool for network attacks and monitoring.
- [Binwalk](https://github.com/ReFirmLabs/binwalk): A tool for analyzing and extracting firmware images.
- [Hashcat](https://hashcat.net/hashcat/): A fast password recovery and cracking tool.
- [Miranda](https://github.com/FauxFaux/Miranda): A tool designed to audit Universal Plug and Play (UPnP) devices.
- [Ncrack](https://nmap.org/ncrack/): A network authentication cracking tool for testing credentials.
- [Nmap](https://nmap.org/): A network scanning and vulnerability detection tool.
- [Pholus](https://github.com/Pholus/pholus): A tool for security assessments of DNS-SD and mDNS services.
- [Reaver](https://github.com/t6x/reaver-wps-fork-t6x): A tool to exploit WPS-enabled routers via brute force attacks.
- [Scapy](https://scapy.net/): A Python-based packet manipulation and network exploration tool.
- [Umap](https://github.com/umap-project/umap): A tool for creating and managing web-based maps.
- [Wifiphisher](https://wifiphisher.org/): A rogue access point framework for phishing and man-in-the-middle attacks.
- [Wireshark](https://www.wireshark.org/): A network protocol analyzer and packet capture tool.
- [Yersinia](https://github.com/tomac/yersinia): A tool for performing Layer 2 network attacks.


## Setup Guide
1. Environment
   - It is recommended that you run the tool in [Kali Linux](https://www.kali.org/get-kali/#kali-platforms). 
   - Use Virtualisation software such as [Virtual Box](https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html).
2. Installation
   - Once you have kali up and running read the [README](https://github.com/Ed-ward-Harris/appAttack-automation/blob/main/README.md) for installation instructions.


## Info for devs
The tool is split up into different files. Below each file is explained.
### main.sh
This is the entry point to the for the application. You can simply run the tool by calling ./main.sh in the terminal. This is recommended if you are adding code and testing it. Again read: [README](https://github.com/Ed-ward-Harris/appAttack-automation/blob/main/README.md).

This file handles the main menu

Any file other than the setup files (install.sh, first_run.sh) need to be sourced by main.sh using

```bash
source "$SCRIPT_DIR/file.sh"
```
When your source a file, that entire file will run sequentially so make sure all code is contained within functions Oherwise th code will run before main. All code that is not in a function should be in main.sh, unless you are declaring global variables such as in the colours.sh file.

### install.sh
This file handles the global installation of the toolkit (creates a symlink). This enables us to call appAttack_toolkit from anywhere to run the too, instead of having to call ./main.sh from the correct location.






















































