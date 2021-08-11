aws deploy create-deployment \
  --application-name CodeDeployGitHubDemo-App \
  --deployment-config-name CodeDeployDefault.OneAtATime \
  --deployment-group-name CodeDeployGitHubDemo-DepGrp \
  --description "My GitHub deployment demo" \
  --github-location repository=tavx/test-app,commitId=`git log origin | head -1 | cut -f 2 -d ' '`\
  --ignore-application-stop-failures
