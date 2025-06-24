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
  local gb_color="#8CC80C"
  local font_color="#333333"
  local branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  # ブランチ名と状態を表示（状態に応じて色変更）
  echo "%K{$gb_color}%F{$font_color} 🐈‍${branch_name} %f%k%F{$gb_color}${ARROW_RIGHT}%f"
}
###------------------------------------------###
## Set up
###------------------------------------------###
setopt prompt_subst
PROMPT='`git-current-status`
%F{white}$ %f'
