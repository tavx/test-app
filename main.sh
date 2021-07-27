#!/bin/bash

echo "remove all html files"
rm -rf ./*.html

URL=${GIT_URL#"git@"}

echo "print all env variables"
cat << EOF > index.html
<html>
<h1>Hello from the simple Jenkins job </h1>
<h2>git commit: https://${URL}/commit/${GIT_COMMIT}
<pre>
$(printenv)
</pre>
</html>
EOF

touch test-variable
#exit 1
