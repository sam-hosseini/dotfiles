function clone_repos
    1password_session
    set --local GITHUB_TOKEN (op item get 'Github' --fields label='Personal Access Token' | jq --raw-output .value)
    set --local DESTINATION_FOLDER ~/Downloads/repos

    set --local URL                 'https://api.github.com/user/repos'
    set --local HEADER              "Authorization: token $GITHUB_TOKEN"
    set --local RESPONSE            (http --body $URL $HEADER)
    set --local REPOS_URLS          (echo $RESPONSE | jq --raw-output '.[].clone_url')

    mkdir -p $DESTINATION_FOLDER
    parallel --linebuffer -j (count $REPOS_URLS) git -C $DESTINATION_FOLDER clone {} ::: $REPOS_URLS
end
