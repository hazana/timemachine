#!/bin/bash

python3 wayback.py "$1"

robots=$(cat "$1"-robots.txt)
url_redirects='login|register|upload|logout|redirect|redir|url='
file_extensions='.php|.asp|.aspx|.jsp|.jspa|.swf|.txt'
local_file_inclusion='file=|location=|locale=|path=|display=|read=|load=|retreive=|include=|require='
remote_file_inclusion='folder=|path=|style=|template=|php_path=|doc=|pg=|pdf=|root='
sql='?=|id=|php?='
xss='contact|keyword=|search='
interesting='admin|api|dump|template|xml|logs|data|install|index.php|source|index.php|template|dev'
