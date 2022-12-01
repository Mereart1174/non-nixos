{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.bottom;
in {
    options.modules.bottom = { enable = mkEnableOption "bottom"; };

    config = mkIf cfg.enable {
        programs.bottom = {
            enable = true;
            setting = {
                colors = {
                    highlighted_border_color = "#f4b8e4";
                    border_color = "#414559";
                    graph_color = "#c6d0f5";
                    cursor_color = "#f4b8e4";
                    table_header_color = "#f4b8e4";
                    selected_bg_color = "Magenta";
                };
                row = {
                    row.child = {
                        type = "cpu";
                        ratio = 3;
                    };
                    row.child = {
                        type = "mem";
                        ratio = 2;
                    };
                };
                row = {
                    ratio = 2;
                    row.child = {
                        ratio = 4;
                        default = true;
                        type = "proc";
                    };
                };
            };
        };
    };
}
