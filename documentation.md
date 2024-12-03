## About  

The AppAttack Toolkit is a versatile, terminal-based tool for penetration testing and secure code review. It simplifies vulnerability assessments by providing step-by-step guides for each included tool and supports automated web application scans. Additionally, the toolkit uses AI to analyse tool outputs, providing insights to enhance understanding and reporting.

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





### install.sh
This file handles the global installation of the toolkit (creates a symlink). This enables us to call appAttack_toolkit from anywhere to run the too, instead of having to call ./main.sh from the correct location. This file will also invoke first_run.sh

### first_run.sh
This file handles the global installation of the toolkit. This allows users to simply call appAttack_toolkit instead of needing to navigate to the correct directory and running ./main.sh. This first_run file is needed as if we just call main in main.sh the while loop will never resolve and the installation will never complete. This file is called by install.sh. Currently when a new tool is added you will have to add the install function to this and the main.sh file (this should be fixed in future by creating a single function and calling this function in both files.

### main.sh
This is the entry point to the for the application. You can simply run the tool by calling ./main.sh in the terminal. This is recommended if you are adding code and testing it. Again read: [README](https://github.com/Ed-ward-Harris/appAttack-automation/blob/main/README.md).

This file handles the main menu

Any file other than the setup files (install.sh, first_run.sh) need to be sourced by main.sh using

```bash
source "$SCRIPT_DIR/file.sh"
```
> $SCRIPT_DIR is set up to dynamically locate the file depeniding on how you run the scirpt (using symlink or not) this means you can also run ./main.sh and it will still work. 

When your source a file, that entire file will run sequentially so make sure all code is contained within functions otherwise the code will run before main. All code that is not in a function should be in main.sh, unless you are declaring global variables such as in the colours.sh file. Everything in this file will run ever single time the application starts, it will then hit the while loop which is when the application becomes useable by the user. 

### install_tools.sh
This contains functions for installing tools. When you want to add a new tool to the toolkit you add the install function here and call the function in `main.sh` **AND** in `first_run.sh`.

### update_tools.sh
This file contains the functions for updating the tools. If you add an new tool, puts its update logic in here and then add that function to the `check_updates` function.

### run_tools.sh
Contains the functions for running each tool. Each tool has different requirements to run. Each tool should have the option to output to file. This will be locate at `$OUTPUT_DIR` which is defined by the user in main

### menus.sh
This file displays all the menus and also handles the menu selection logic (except for the main menu, this is in main). If a new tool is added make sure you update the display menu function for that category as well as the handle function for that category.

### step_by_step.sh
Contains all the step by step guide logic.

### automate.sh
Runs automated penetration testing scans on web applications. Then gets AI insights from the output. 

### colours.sh
This is simply just global varibales that hold colour values so we can keep the styling consitant. Feel free to use any of these variables for colours when printing to the terminal

### utilities.sh
This file contains misc functions such as generating ai insights and output logging. In future these could be split into their own files if these functionalities get expanded upon.


---

### To Add a New Tool
1. Write the install function in `install.sh`, call that function in `main.sh` and `first_run.sh1`
2. Write the update function for the tool in `update.sh`
3. Create a function in `run_tools.sh` with the specified paramaters (make sure it accepts logging)
4. Include a step-by-step guide in `step_by_step.sh`
5. In the `menus.sh` file update the appropriate menu to display the new tool and make corresponding handle function is also updated

