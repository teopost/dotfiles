# 1. Install:
#    brew install fzf tmuz 
# 2. add to .zshrc:
#    source "$HOME/.dotfiles/utils/k8s-funcs.sh"  
# 3. Some links:
#      * https://www.spectrocloud.com/blog/how-to-quickly-switch-between-kubernetes-clusters
#      * https://github.com/predatorray/kubectl-tmux-exec
#      * https://github.com/thecasualcoder/kube-tmuxp
#      * https://www.hostinger.com/tutorials/tmux-config

kz-setconfig() {
  (
    cd ~/.kube/ || exit 1
    KUBE=$(ls kube-* | fzf)
    [[ -n "$KUBE" ]] && ln -sf "$KUBE" config
    cd $OLDPWD
  )
}

kz-setctx() {
    cd ~/.kube/ || exit 1
    KUBE=$(ls kube-* | fzf)
    if [[ -n "$KUBE" ]]; then
      export KUBECONFIG="$HOME/.kube/$KUBE"
    fi
    cd $OLDPWD
}

kz-setmux() {
    cd ~/.kube/ || exit 1
    KUBE=$(ls kube-* | fzf)
    # session alread exists?
    sesscount=$(tmux ls  | grep $KUBE | wc -l)
    cd $OLDPWD
    if [ $sesscount -eq 1 ]; then
      tmux attach -t $KUBE
    elif  [ $sesscount -gt 1 ]; then
      echo 'ERR: Too many sessions found'
    else
      if [[ -n "$KUBE" ]]; then
        tmux set-option -g status-right "$KUBE"
        tmux new-session -s "$KUBE" \; \
          send-keys -t 0 "export KUBECONFIG="$HOME/.kube/$KUBE C-m
      fi
    fi
}

