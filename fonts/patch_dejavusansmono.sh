#!/usr/bin/env bash
set -ex

FONT_NORMAL=DejaVuSansMonoNerdNormal.ttf
FONT_BOLD=DejaVuSansMonoNerdBold.ttf
FONT_OBLIQUE=DejaVuSansMonoNerdOblique.ttf
FONT_BOLD_OBLIQUE=DejaVuSansMonoNerdBoldOblique.ttf

FONT_PATCHER=./font-patcher
OPTIONS="--fontawesome \
--fontawesomeextension \
--fontlogos \
--octicons \
--codicons \
--powersymbols \
--pomicons \
--material \
--careful \
--powerline \
--powerlineextra \
--weather \
--mono \
--adjust-line-height \
--variable-width-glyphs \
--makegroups"

FONT_LIST=("./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-BoldOblique.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-Oblique.ttf" "./dejavu-fonts-ttf-2.37/ttf/DejaVuSansMono-Bold.ttf")

for FONT in ${FONT_LIST[@]};do
  ${FONT_PATCHER} ${OPTIONS} "${FONT}"
done

# mv 'DejaVu Sans Mono Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono Bold Oblique.ttf' ${FONT_BOLD_OBLIQUE}
# mv 'DejaVu Sans Mono Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono Bold.ttf' ${FONT_BOLD}
# mv 'DejaVu Sans Mono Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono Oblique.ttf' ${FONT_OBLIQUE}
# mv 'DejaVu Sans Mono Nerd Font Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Weather Icons Mono.ttf' ${FONT_NORMAL}

mv './DejaVu Sans Mono Nerd Font Complete Mono Bold Oblique.ttf' ${FONT_BOLD_OBLIQUE}
mv './DejaVu Sans Mono Nerd Font Complete Mono Bold.ttf' ${FONT_BOLD}
mv './DejaVu Sans Mono Nerd Font Complete Mono Oblique.ttf' ${FONT_OBLIQUE}
mv './DejaVu Sans Mono Nerd Font Complete Mono.ttf' ${FONT_NORMAL}

sudo cp ./DejaVuSansMonoNerdBold.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdBoldOblique.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdNormal.ttf /usr/share/fonts/TTF/
sudo cp ./DejaVuSansMonoNerdOblique.ttf /usr/share/fonts/TTF/

sudo fc-cache -fv
