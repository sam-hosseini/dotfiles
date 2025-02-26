function git_browse_commits
    set --local ORIGIN_URL (git remote get-url origin)
    set --local RESULT (echo $ORIGIN_URL | sd '^(?:git@|https://)([^:/]+)[/:]([^/]+)/([^/]+)\.git$' '$1 $2 $3')

    set --local DOMAIN (echo $RESULT | cut -d ' ' -f1)
    set --local USERNAME (echo $RESULT | cut -d ' ' -f2)
    set --local REPO (echo $RESULT | cut -d ' ' -f3)

    set --local URL "https://$DOMAIN/$USERNAME/$REPO/commits/"

    open $URL
end
