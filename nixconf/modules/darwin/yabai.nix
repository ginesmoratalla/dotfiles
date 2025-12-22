{ config, pkgs, home-manager, ... }:
{
  services.yabai = {

    enable = true;
    config = {
      window_placement = "second_child";
      layout = "bsp";

      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      window_gap = 12;

      mouse_follows_focus = "on";
      mouse_modifier = "alt";

      # Left click + drag
      mouse_action1 = "move";
      # Right click + drag 
      mouse_action2 = "resize";
      mouse_drop_action = "swap";

    };
    extraConfig = ''
      yabai -m rule --add app="^System Settings" manage=off
      yabai -m rule --add app="^Raycast" manage=off
      yabai -m rule --add app="^Finder" manage=off
      yabai -m rule --add app="^Activity Monitor" manage=off
      yabai -m rule --add app="^Bitwarden" manage=off
      yabai -m signal --add app='^Ghostty$' event=window_created action='yabai -m space --layout bsp'
      yabai -m signal --add app='^Ghostty$' event=window_destroyed action='yabai -m space --layout bsp'

      handle_display_change() {
        # Focus recent space
        yabai -m space --focus recent
        # Focus previous space
        yabai -m space --focus prev
      }

      yabai -m rule --add signal=display_added action="handle_display_change"
      yabai -m rule --add signal=display_removed action="handle_display_change"
      yabai -m rule --add signal=display_moved action="handle_display_change"
    '';
  };
}
