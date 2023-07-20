
#!/bin/bash

# sudo vim /usr/share/applications/nvim.desktop
# Exec=kitty -e sh -c "nvim %F"
sudo su <<EOF
cp /home/zed/arch-z/optional/nvim.desktop ~/.local/share/applications/nvim.desktop
exit
EOF
