vim9script
##
# ::: Fzf Filefind :::
#

import './fzf-options.vim' as Fzf

def FzfFilefindSource(): list<string>
  return split(system('fd --type file --color always .'), "\n")
enddef

def FzfFilefindSink(entry: list<string>): void
  var [key, value] = entry

  if key == 'enter'
    execute $"edit {value}"
  elseif key == 'ctrl-t'
    execute $"tabedit {value}"
  elseif key == 'ctrl-s'
    execute $"split {value}"
  elseif key == 'ctrl-v'
    execute $"vsplit {value}"
  endif
enddef

export def FzfFilefind(): void
  var fzf_filefind_options = {
    'source': FzfFilefindSource(),
    'sink*': FzfFilefindSink
  }

  var fzf_spec = extendnew(fzf_filefind_options, Fzf.options)

  fzf#run(fzf_spec)
enddef

