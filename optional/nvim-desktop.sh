
#!/bin/bash

# sudo vim /usr/share/applications/nvim.desktop
# Exec=kitty -e sh -c "nvim %F"
sudo su <<EOF
cp /home/$USER/arch-z/optional/nvim.desktop /home/$USER/.local/share/applications/nvim.desktop
exit
EOF
