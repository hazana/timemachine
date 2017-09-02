#!/usr/bin/env python3
import sys
import re
import json
import argparse
import requests
from multiprocessing.dummy import Pool


def robots(host):
    r = requests.get(
        'https://web.archive.org/cdx/search/cdx\
        ?url={}/robots.txt&output=json&fl=timestamp,original&filter=statuscode:200&collapse=digest'.format(host))
    results = r.json()
    if len(results) == 0: # might find nothing
        return []
    results.pop(0)  # The first item is ['timestamp', 'original']
    return results


def getpaths(snapshot):
    url = 'https://web.archive.org/web/{0}/{1}'.format(*snapshot)
    robotstext = requests.get(url).text
    if 'Disallow:' in robotstext:  # verify it's acually a robots.txt file, not 404 page
        paths = re.findall('/.*', robotstext)
        return paths
    return []

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

    snapshots = robots(args.host)
    print('Found {} unique results'.format(len(snapshots)))
    if not snapshots:
        sys.exit()
    print('This may take some time...')
    pool = Pool(4)
    paths = pool.map(getpaths, snapshots)
    unique_paths = set()
    for i in paths:
        unique_paths.update(i)
    filename = '{}-robots.txt'.format(args.host)
    with open(filename, 'w') as f:
        f.write('\n'.join(unique_paths))
    print('[*] Saved results to {}'.format(filename))
