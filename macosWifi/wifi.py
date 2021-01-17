#!/usr/local/bin/p3
import subprocess

class Main:
    def __init__(self):
        data = {
            row.split(':')[0].strip(): row.split(':')[1].strip()
            for row in subprocess.check_output(
                f'''/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I''',
                shell=True
            )
            .decode('utf-8')
            .split('\n')
            if len(row) > 0
        }
        if 'state' in data and data['state'] == 'running':
            print(f"| 索{ data['SSID'] } |")
        else:
            print("")

if __name__ == '__main__':
    Main()
