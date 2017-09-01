#!/usr/bin/env python3
import sys
import json
import argparse
import requests


def waybackurls(host, with_subs):
    url = 'http://web.archive.org/cdx/search/cdx?url={glob}{host}/*&output=json&fl=original&collapse=urlkey'.format(glob='*.' if with_subs else '', host=host)
    r = requests.get(url)
    results = r.json()
    return results[1:]


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("host", help="host to scan")
    parser.add_argument("--with-subs", help="scan url's subdomains also", action="store_true")
    args = parser.parse_args()

    urls = waybackurls(args.host, args.with_subs)
    json_urls = json.dumps(urls)
    if urls:
        filename = '{}-waybackurls.json'.format(args.host)
        with open(filename, 'w') as f:
            f.write(json_urls)
        print('[*] Saved results to {}'.format(filename))
    else:
        print('[-] Found nothing')
