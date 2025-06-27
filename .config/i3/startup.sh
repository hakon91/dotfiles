i3-msg "workspace 1; exec --no-startup-id alacritty";
sleep 1 #this will make the script pause for 5 seconds;
i3-msg "workspace 2; exec --no-startup-id firefox";
sleep 3
i3-msg "workspace 3; exec --no-startup-id firefox --new-window https://teams.microsoft.com/v2/";
sleep 3
i3-msg "workspace 4; exec --no-startup-id firefox --new-window https://outlook.office.com/mail/";
sleep 3
i3-msg "workspace 5; exec --no-startup-id code";
sleep 4;
i3-msg "workspace 6; exec --no-startup-id spotify";
sleep 3;
i3-msg "workspace 8; exec --no-startup-id code";
sleep 4;

i3-msg "workspace 1";
