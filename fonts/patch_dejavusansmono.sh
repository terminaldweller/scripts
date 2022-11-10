#!/usr/bin/env bash
set -ex

FONT_PATCHER=./font-patcher
OPTIONS="--adjust-line-height \
--fontawesome \
--fontawesomeextension \
--fontlogos \
--octicons \
--codicons \
--powersymbols \
--pomicons \
--powerline \
--powerlineextra \
--weather \
--variable-width-glyphs \
--careful"

FONT_LIST=("./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-BoldOblique.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-Oblique.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-Bold.ttf")

for FONT in ${FONT_LIST[@]};do
  ${FONT_PATCHER} ${OPTIONS} ${FONT}
done

mv DejaVu\ Sans\ Mono\ Bold\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Font\ Awesome\ Extension\ Plus\ Octicons\ Plus\ Power\ Symbols\ Plus\ Codicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ Plus\ Weather\ Icons.ttf DejaVuSansMonoNerdBold.ttf
mv DejaVu\ Sans\ Mono\ Bold\ Oblique\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Font\ Awesome\ Extension\ Plus\ Octicons\ Plus\ Power\ Symbols\ Plus\ Codicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ Plus\ Weather\ Icons.ttf DejaVuSansMonoNerdBoldOblique.ttf
mv DejaVu\ Sans\ Mono\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Font\ Awesome\ Extension\ Plus\ Octicons\ Plus\ Power\ Symbols\ Plus\ Codicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ Plus\ Weather\ Icons.ttf DejaVuSansMonoNerdNormal.ttf
mv DejaVu\ Sans\ Mono\ Oblique\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Font\ Awesome\ Extension\ Plus\ Octicons\ Plus\ Power\ Symbols\ Plus\ Codicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ Plus\ Weather\ Icons.ttf DejaVuSansMonoNerdOblique.ttf

# mv 'DejaVu Sans Mono Bold Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono.ttf' DejaVuSansMonoNerdBold.ttf
# mv 'DejaVu Sans Mono Bold Oblique Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono.ttf' DejaVuSansMonoNerdBoldOblique.ttf
# mv 'DejaVu Sans Mono Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono.ttf' DejaVuSansMonoNerdNormal.ttf
# mv 'DejaVu Sans Mono Oblique Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono.ttf' DejaVuSansMonoNerdOblique.ttf

sudo cp ./DejaVuSansMonoNerdBold.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdBoldOblique.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdNormal.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdOblique.ttf /usr/share/fonts/TTF/

sudo fc-cache -fv
