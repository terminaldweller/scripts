#!/usr/bin/env bash

get_interp() {
  shebang=$(head -1 "$1")
  IFS='/' read -ra arr_slash <<< "$shebang"
  IFS=' ' read -ra arr_space <<< "${arr_slash[-1]}"

  if [[ ${arr_space[0]} == "env" ]];then
    echo "${arr_space[1]}"
  else
    echo "${arr_space[0]}"
  fi
}

case "$1" in
    *.as|*.mxml|*.bc|*.g|*.gd|*.gi|*.gap|*.nb|*.cdf|*.nbp|*.ma|*.mu|*.at|*.run|\
    *.apl|*.adl|*.adls|*.adlf|*.adlx|*.cadl|*.odin|*.c-objdump|*.s|\
    *.cpp-objdump|*.c++-objdump|*.cxx-objdump|*.d-objdump|*.S|*.hsail|\
    *.ll|*.asm|*.ASM|*.objdump-intel|*.objdump|*.tasm|*.au3|*.ahk|*.ahkl|\
    *.bb|*.decls|*.bmx|*.bas|*.monkey|*.BAS|*.bst|*.bib|*.abap|*.ABAP|*.cbl|\
    *.CBL|*.cob|*.COB|*.cpy|*.CPY|*.gdc|*.maql|*.p|*.cls|*.c|*.h|*.idc|*.cpp|\
    *.hpp|*.c++|*.h++|*.cc|*.hh|*.cxx|*.hxx|*.C|*.H|*.cp|*.CPP|*.ino|*.clay|\
    *.cu|*.cuh|*.ec|*.eh|*.mq4|*.mq5|*.mqh|*.nc|*.pike|*.pmod|*.swg|*.i|*.vala|\
    *.vapi|*.capnp|*.chpl|*.icl|*.dcl|*.cf|*.docker|*.ini|*.cfg|*.inf|\
    *.pc|*.properties|*.reg|*.tf|*.pypylog|*.cr|*.csd|*.orc|*.sco|*.css|\
    *.less|*.sass|*.scss|*.croc|*.d|*.di|*.smali|*.jsonld|*.json|*.yaml|\
    *.yml|*.dpatch|*.darcspatch|*.diff|*.patch|*.wdiff|*.boo|*.aspx|*.asax|\
    *.ascx|*.ashx|*.asmx|*.axd|*.cs|*.fs|*.fsi|*.n|*.vb|*.als|*.bro|*.crmsh|\
    *.pcmk|*.msc|*.pan|*.proto|*.pp|*.rsl|*.sbl|*.thrift|*.rpf|\
    *.dylan-console|*.dylan|*.dyl|*.intr|*.lid|*.hdp|*.ecl|*.e|*.elm|*.ex|\
    *.exs|*.erl|*.hrl|*.es|*.escript|*.erl-sh|*.aheui|*.befunge|*.bf|*.b|\
    *.camkes|*.idl4|*.cdl|*.cw|*.factor|*.fan|*.flx|*.flxh|*.frt|*.f|*.F|\
    *.f03|*.f90|*.F03|*.F90|*.PRG|*.prg|*.go|*.abnf|*.bnf|*.jsgf|*.cyp|\
    *.cypher|*.asy|*.vert|*.frag|*.geo|*.plot|*.plt|*.ps|*.eps|*.pov|*.inc|\
    *.agda|*.cry|*.hs|*.idr|*.kk|*.kki|*.lagda|*.lcry|*.lhs|*.lidr|*.hx|\
    *.hxsl|*.hxml|*.sv|*.svh|*.v|*.vhdl|*.vhd|*.dtd|*.haml|*.html|*.htm|\
    *.xhtml|*.xslt|*.pug|*.jade|*.scaml|*.xml|*.xsl|*.rss|*.xsd|*.wsdl|\
    *.wsf|*.xpl|*.pro|*.ipf|*.nsi|*.nsh|*.spec|*.i6t|*.ni|*.i7x|*.t|*.io|\
    *.ijs|*.coffee|*.dart|*.eg|*.js|*.jsm|*.juttle|*.kal|*.lasso|\
    *.lasso[89]|*.ls|*.mask|*.j|*.ts|*.tsx|*.jl|*.aj|*.ceylon|*.clj|\
    *.cljs|*.golo|*.gs|*.gsx|*.gsp|*.vark|*.gst|*.groovy|*.gradle|*.ik|\
    *.java|*.kt|*.pig|*.scala|*.xtend|*.cpsa|*.cl|*.lisp|*.el|*.hy|*.lsp|*.nl|\
    *.kif|*.rkt|*.rktd|*.rktl|*.scm|*.ss|*.shen|*.xtm|*.cmake|*.mak|*.mk|\
    *.[1234567]|*.man|*.md|*.css*.in|*.js*.in|*.xul*.in|*.rst|*.rest|*.tex|\
    *.aux|*.toc|*.m|*.sci|*.sce|*.tst|*.ml|*.mli|*.mll|*.mly|*.opa|*.sml|*.sig|\
    *.fun|*.bug|*.jag|*.mo|*.stan|*.def|*.mod|*.mt|*.ncl|*.nim|*.nimrod|*.nit|\
    *.nix|*.cps|*.x|*.xi|*.xm|*.xmi|*.mm|*.swift|*.ooc|*.psi|*.psl|*.G|*.ebnf|\
    *.rl|*.treetop|*.tt|*.adb|*.ads|*.ada|*.pas|*.dpr|*.pwn|*.sp|*.pl|*.pm|\
    *.nqp|*.p6|*.6pl|*.p6l|*.pl6|*.6pm|*.p6m|*.pm6|*.php|*.php[345]|*.zep|\
    *.praat|*.proc|*.psc|*.lgt|*.logtalk|*.prolog|*.pyx|*.pxd|*.pxi|*.dg|\
    *.py3tb|*.py|*.pyw|*.sc|*.tac|*.sage|*.pytb|*.qvto|*.Rout|*.Rd|*.R|*.rq|\
    *.sparql|*.ttl|*.r|*.r3|*.reb|*.red|*.reds|*.txt|*.rnc|*.graph|\
    *.instances|*.robot|*.fy|*.fancypack|*.rb|*.rbw|*.rake|*.gemspec|\
    *.rbx|*.duby|*.rs|*.rs*.in|*.SAS|*.sas|*.applescript|*.chai|*.ezt|\
    *.mac|*.hyb|*.jcl|*.lsl|*.lua|*.wlua|*.moo|*.moon|*.rexx|*.rex|*.rx|\
    *.arexx|*.sh|*.ksh|*.bash|*.ebuild|*.eclass|*.exheres-0|*.exlib|*.zsh|\
    *.sh-session|*.shell-session|*.bat|*.cmd|*.fish|*.load|*.ps1|*.psm1|\
    *.tcsh|*.csh|*.ns2|*.st|*.smv|*.snobol|*.rql|*.sql|*.sqlite3-console|\
    *.do|*.ado|*.scd|*.tcl|*.rvt|*.ng2|*.tmpl|*.spt|*.cfc|*.cfm|*.cfml|\
    *.evoque|*.kid|*.handlebars|*.hbs|*.phtml|*.jsp|*.liquid|*.mao|*.mhtml|\
    *.mc|*.mi|*.myt|*.rhtml|*.tpl|*.ssp|*.tea|*.twig|*.vm|*.fhtml|*.sls|\
    *.feature|*.tap|*.awk|*.vim|*.pot|*.po|*.weechatlog|*.todotxt|*.thy|\
    *.lean|*.rts|*.u|*.vcl|*.bpl|*.sil|*.vpr|*.cirru|*.duel|*.jbst|*.qml|\
    *.qbs|*.slim|*.xqy|*.xquery|*.xq|*.xql|*.xqm|*.whiley|*.x10)
        pygmentize -f 256 -O style="$PYGMENTIZE_STYLE" "$1" | nl -b a;;
    *)
        # interp=$(get_interp "$1")
        # pygmentize -f 256 -O style="$PYGMENTIZE_STYLE" -l "$interp" "$1" | nl -b a
        pygmentize -f 256 -O style="$PYGMENTIZE_STYLE" -g "$1" | nl -b a
esac

exit 0
