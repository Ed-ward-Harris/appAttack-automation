#!/bin/bash

# File to store cumulative results
results_file="results.txt"

# Clear the results file before starting
> "$results_file"

# Directory to store individual scan results
results_dir="./auto_scan_results"
mkdir -p "$results_dir"

# Outputs to log file and the cumulative results file
log_output() {
    local message="$1"
    echo -e "$message" | tee -a "$results_file"
}

# Function to run Nmap
auto_nmap() {
    local log_file="$results_dir/nmap_results.txt"
    log_output "Running Nmap..."
    #ai_output=$(nmap -p "$port" --script=http-enum,http-title,http-methods,http-headers,http-server-header,http-vuln-cve2017-5638 -A -T4 "$ip")
    nmap_ai_output=$(nmap "$ip")
    nmap "$ip" > "$log_file"
    #nmap "$ip" | tee "$log_file"
    log_output "Nmap scan completed. Results saved to $log_file\n"
    echo "$log_file"
    #generate_ai_insights "$ai_output"
}

#Function to run Nikto
auto_nikto() {
    local log_file="$results_dir/nikto_results.txt"
    log_output "Running Nikto..."
    #nikto -h "$ip:$port" > "$log_file" 2>> error_log.txt
    nikto_ai_output=$(nikto -h "$ip:$port")
    nikto -h "$ip"
    log_output "Nikto scan completed. Results saved to $log_file\n"
    echo "$log_file"
}

# Function to run OWASP ZAP
auto_zap() {
    local log_file="$results_dir/zap_results.txt"
    local html_report="$results_dir/zap_report.html"
    log_output "Running OWASP ZAP..."
    #zap -quickurl "http://$ip:$port" -quickout "$html_report" -cmd > "$log_file" 2>> error_log.txt
    zap_ai_output=$(zap -quickurl "http://$ip:$port" -cmd)
    echo "zap_ai_output"
    log_output "OWASP ZAP scan completed. Results saved to $log_file and $html_report\n"
    echo "$log_file"
}

# Function to run Wapiti
auto_wapiti() {
    local log_file="$results_dir/wapiti_results.txt"
    local html_report="$results_dir/wapiti_scan_result.html"
    log_output "Running Wapiti..."
    #wapiti -u "http://$ip:$port" -o "$html_report" > "$log_file" 2>> error_log.txt
    wapiti_ai_output=$(wapiti -u "http://$ip:$port")
    log_output "Wapiti scan completed. Results saved to $log_file and $html_report\n"
    echo "$log_file"
}

# Function to generate AI insights
generate_ai_insights_wrapper() {
    local log_files=("$@")
    for file in "${log_files[@]}"; do
        local output_content
        output_content=$(cat "$file")
        log_output "Generating AI insights for $file..."
        generate_ai_insights "$output_content" "y" "$file"
        log_output "AI insights appended to $file\n"
    done
}

# Run automated scans
run_automated_scan() {
    read -p "Enter the target IP address: " ip
    read -p "Enter the target port: " port
    log_output "Starting automated scans for IP: $ip and Port: $port\n"

    auto_nmap
    auto_nikto
    auto_zap
    auto_wapiti
    echo "y" | generate_ai_insights "$nmap_ai_output" >> ./nmap_ai.txt
    echo "y" | generate_ai_insights "$nikto_ai_output"
    echo "y" | generate_ai_insights "$zap_ai_output"
    echo "y" | generate_ai_insights "$wapiti_ai_output"

    # ai_out="${nmap_ai_output}\n"\
    # "${nikto_ai_output}\n"\
    # "${zap_ai_output}\n"\
    # "${wapiti_ai_output}"
    # generate_ai_insights "$ai_out"
    
    # Run scans and collect log files
    # local log_files=()
    # log_files+=("$(auto_nmap)")
    # log_files+=("$(auto_nikto)")
    # log_files+=("$(auto_zap)")nmap_output=$(nmap "$url")
    # log_files+=("$(auto_wapiti)")

    log_output "All scans completed. Generating AI insights..."
    generate_ai_insights_wrapper "${log_files[@]}"
    log_output "All scans and AI insights completed."
}

