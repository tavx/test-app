#!/bin/bash

#URL=${GIT_URL#"git@"}
#URL=${URL/://}
#URL=${URL%".git"}
echo "print all env variables"
cat << EOF > index.html
<html>
<h1>Hello from the simple Jenkins job </h1>
<h2>git commit: <a href="https://${URL}/commit/${GIT_COMMIT}">https://${URL}/commit/${GIT_COMMIT}</a></h2>
<pre>
$(printenv)
</pre>
</html>
EOF

#mkdir target
#zip ./target/output.zip index.html appspec.yml
#echo "remove all html files"
#rm -rf ./*.html

#touch test-variable
#exit 1
