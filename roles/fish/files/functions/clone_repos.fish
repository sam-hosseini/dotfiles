function clone_repos
    1password_session
    set --local GITHUB_TOKEN (op get item github | jq --raw-output '.details.sections[2].fields[1].v')

    set --local URL                 'https://api.github.com/user/repos'
    set --local HEADER              "Authorization: token $GITHUB_TOKEN"
    set --local RESPONSE            (http --body $URL $HEADER)
    set --local REPOS_URLS          (echo $RESPONSE | jq --raw-output '.[].clone_url')

    parallel --linebuffer -j (count $REPOS_URLS) git -C ~/repos clone {} ::: $REPOS_URLS
end
