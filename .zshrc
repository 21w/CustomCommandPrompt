###------------------------------------------###
## Functions
###------------------------------------------###
## Gitブランチを表示する関数
function git-current-status {
  # Gitリポジトリ内でない場合は何も表示しない
  if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi

  local ARROW_RIGHT=$'\ue0b0'
  local bg_color="#8CC80C"
  local next_bg_color="#97D3FF"
  local font_color="#333333"
  local branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  
  echo "%K{$bg_color}%F{$font_color} 🐈‍%B[Git]%b${branch_name} %f%k""%K{$next_bg_color}%F{$bg_color}${ARROW_RIGHT}%f%k"
}
## Dockerの状態を表示する関数
function docker-current-status {
  local ARROW_RIGHT=$'\ue0b0'
  local bg_color="#97D3FF"
  local font_color="#333333"
  local docker_status

  if docker info >/dev/null 2>&1; then
      docker_status="☀️"
  else
      docker_status="💤"
  fi

  echo "%K{$bg_color} 🐳$docker_status %k""%F{$bg_color}${ARROW_RIGHT}%f"
}
###------------------------------------------###
## Set up
###------------------------------------------###
setopt prompt_subst
PROMPT='`git-current-status``docker-current-status`
%F{white}$ %f'
