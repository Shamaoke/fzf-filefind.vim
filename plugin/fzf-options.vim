vim9script
##
# ::: Fzf Options :::
#

export const options = {
  'window': {
    'width':  0.8,
    'height': 0.9,
    'border': 'sharp'
  },
  'options': [
    '--no-multi',
    '--preview-window=sharp:',
    '--preview=bat --color=always --style=numbers {1}',
    '--ansi',
    '--expect=enter,ctrl-t,ctrl-s,ctrl-v'
  ]
}
