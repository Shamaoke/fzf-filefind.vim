vim9script
##
# ::: Fzf Filefind :::
#

import './fzf-options.vim' as Fzf

def FzfFilefindSource(): list<string>
  return split(system('fd --type file --color always .'), "\n")
enddef

def FzfFilefindSink(word: string): void
  execute $"edit {word}"
enddef

export def FzfFilefind(): void
  var fzf_spellsuggest_options = {
    'source': FzfFilefindSource(),
    'sink': FzfFilefindSink
  }

  var fzf_spec = extend(fzf_spellsuggest_options, Fzf.options)

  fzf#run(fzf_spec)
enddef

