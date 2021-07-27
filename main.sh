#!/bin/bash

echo "remove all html files"
rm -rf ./*.html

echo "print all env variables"
cat << EOF > index.html
<html>
<h1>Hello from simple Jenkins job</h2>
<code>
$(printenv)
</code>
</html>
EOF

touch test-variable
#exit 1
