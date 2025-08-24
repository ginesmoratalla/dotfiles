{ pkgs
, lib
, ...
}:
let
  # stdenv = pkgs.stdenv;
  customPlugins = with pkgs.tmuxPlugins; {
    sensible = mkTmuxPlugin {
      pluginName = "sensible";
      version = "unstable-2025-22-08";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-sensible";
        rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
        sha256 = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
      };
    };
    catppucin = mkTmuxPlugin rec {
      pluginName = "catppuccin";
      version = "2.1.3";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "tmux";
        rev = "v${version}";
        sha256 = "sha256-Is0CQ1ZJMXIwpDjrI5MDNHJtq+R3jlNcd9NXQESUe2w=";
      };
    };
    cpu = mkTmuxPlugin {
      pluginName = "cpu";
      version = "unstable-2025-22-08";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-cpu";
        rev = "bcb110d754ab2417de824c464730c412a3eb2769";
        sha256 = "sha256-OrQAPVJHM9ZACyN36tlUDO7l213tX2a5lewDon8lauc=";
      };
      rtpFilePath = "cpu.tmux";
    };
  };

  pluginShells = map (x: "run-shell " + x + "/share/tmux-plugins/${x.pluginName}/${x.pluginName}.tmux") (builtins.attrValues customPlugins);
  
in {
  programs.tmux = {
    enable = true;
    newSession = false;
    terminal = "screen-256color";
    plugins = builtins.attrValues customPlugins;
    extraConfig = ''
      set -g mouse on

      bind -r h resize-pane -L
      bind -r j resize-pane -D
      bind -r k resize-pane -U
      bind -r l resize-pane -R

      set -g @myspace "#[bg=default,fg=default]#[bg=#{@thm_crust},fg=#{@thm_crust}] "
      set -g terminal-overrides ',xterm-256color*:RGB'
      set -g update-environment 'EDITOR'

      bind -n M-H previous-window
      bind -n M-L next-window

      # Catppuccin customization
      set -g status-right-length 100
      set -g status-interval 5
      set -g @catppuccin_flavor "mocha"

      # Windows
      set -g @catppuccin_window_text " #W"
      set -g @catppuccin_window_current_text " #W"
      set -g @catppuccin_window_current_number_color '#f5d742'
      set -g @cpu_low_bg_color "#[bg=#{@thm_green}]"        # background color when cpu is low
      set -g @cpu_medium_bg_color "#[bg=#{@thm_yellow}]"    # background color when cpu is medium
      set -g @cpu_high_bg_color "#[bg=#{@thm_red}]"         # background color when cpu is high

      set -g status-left "#[fg=#3bb843]   "                # So the session doesn't show on the left 

      set -g status-right '#[fg=#{@thm_crust}]#{cpu_bg_color} CPU #{cpu_icon} #{cpu_percentage} #{@myspace}'
      set -ag status-right "#[bg=#{@thm_flamingo},fg=#{@thm_crust}]#[reverse]#[noreverse] MEM #(memory_pressure | awk '/percentage/{print $5}') #{@myspace}"
      set -ag status-right "#[fg=#{@thm_crust},bg=#{@thm_blue}] #(whoami)  "

    '' + builtins.concatStringsSep "\n" pluginShells;
  };
}
