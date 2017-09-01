#!/bin/bash

python3 waybackurls.py "$1"
python3 waybackrobots.py "$1"

#Robots
result_robots=$(cat "$1"-robots.txt)

#URL Redirects
result_url_redirect1=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'login')
result_url_redirect2=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'register')
result_url_redirect3=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'upload')
result_url_redirect4=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'logout')
result_url_redirect5=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'redirect')
result_url_redirect6=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'redir')
result_url_redirect7=$(python -mjson.tool $1-waybackurls.json | grep -i -m5 'url=')

#File Extensions
result_file_extensions1=$(python -mjson.tool $1-waybackurls.json | grep -i -m50 '.php')
result_file_extensions2=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.asp')
result_file_extensions3=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.aspx')
result_file_extensions4=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.jsp')
result_file_extensions5=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.jspa')
result_file_extensions6=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.swf')
result_file_extensions7=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 '.txt')

#Local File Inclusion
result_file_inclusion1=$(python -mjson.tool $1-waybackurls.json | grep -i -m50 'file=')
result_file_inclusion2=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'location=')
result_file_inclusion3=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'locale=')
result_file_inclusion4=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'path=')
result_file_inclusion5=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'display=')
result_file_inclusion6=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'read=')
result_file_inclusion7=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'load=')
result_file_inclusion8=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'retreive=')
result_file_inclusion9=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'include=')
result_file_inclusion10=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'require=')

#Remote File Inclusion
result_rfile_inclusion1=$(python -mjson.tool $1-waybackurls.json | grep -i -m50 'folder=')
result_rfile_inclusion2=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'path=')
result_rfile_inclusion3=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'style=')
result_rfile_inclusion4=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'template=')
result_rfile_inclusion5=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'php_path=')
result_rfile_inclusion6=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'doc=')
result_rfile_inclusion7=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'pg=')
result_rfile_inclusion8=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'pdf=')
result_rfile_inclusion9=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'root=')

#SQL
result_sql_injection=$(python -mjson.tool $1-waybackurls.json | egrep -i -m50 '?=|id=|php?=')

#XSS
result_xss=$(python -mjson.tool $1-waybackurls.json | egrep -i -m50 'contact|keyword=|search=')

#Interesting
result_interesting1=$(python -mjson.tool $1-waybackurls.json | egrep -i -m100 'admin|api|dump|template|xml|logs|data|install|index.php|source')
result_interesting2=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'index.php')
result_interesting3=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'template')
result_interesting4=$(python -mjson.tool $1-waybackurls.json | grep -i -m10 'dev')

echo
echo 'Created by Hazana'
echo
echo '---------------------------------------------'
echo 'Robots.txt: '
echo
echo $result_robots | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo
echo '---------------------------------------------'
echo 'URL Redirect: '
echo
echo $result_url_redirect1 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect2 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect3 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect4 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect5 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect6 | sed -e 's/\s\+/\n/g'
echo $result_url_redirect7 | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo
echo '---------------------------------------------'
echo 'File Extensions: '
echo
echo $result_file_extensions1 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions2 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions3 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions4 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions5 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions6 | sed -e 's/\s\+/\n/g'
echo $result_file_extensions7 | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo
echo '---------------------------------------------'
echo 'Local File Inclusion: '
echo
echo $result_file_inclusion1 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion2 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion3 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion4 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion5 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion6 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion7 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion8 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion9 | sed -e 's/\s\+/\n/g'
echo $result_file_inclusion10 | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo '---------------------------------------------'
echo 'Remote File Inclusion: '
echo
echo $result_file_rinclusion1 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion2 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion3 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion4 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion5 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion6 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion7 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion8 | sed -e 's/\s\+/\n/g'
echo $result_file_rinclusion9 | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo
echo '---------------------------------------------'
echo 'SQLi: '
echo
echo $result_sql_injection | sed -e 's/\s\+/\n/g'
echo '---------------------------------------------'
echo
echo
echo '---------------------------------------------'
echo 'XSS: '
echo
echo $result_xss | sed -e 's/\s\+/\n/g'
echo
echo '---------------------------------------------'
echo 'Interesting: '
echo
echo $result_interesting1 | sed -e 's/\s\+/\n/g'
echo $result_interesting2 | sed -e 's/\s\+/\n/g'
echo $result_interesting3 | sed -e 's/\s\+/\n/g'
echo
echo '---------------------------------------------'
echo
