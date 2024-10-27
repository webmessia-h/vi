{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hlchunk";
      src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
        rev = "v1.3.0";
        hash = "sha256-UGxrfFuLJETL/KJNY9k4zehxb6RrXC6UZxnG+7c9JXw=";
      };
    })
  ];

  extraConfigLua = ''
    local default_conf = {
        enable = true,
        notify = true,  -- Enabled notifications
        exclude_filetypes = {
            alpha = true,
            dashboard = true,
            -- some other exclude_filetypes
        },
    }

    local chunk_conf = {
        enable = true,
        priority = 15,
        style = {
            { fg = "#A988B0" },
            { fg = "#c21f30" },
        },
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        textobject = "",
        max_file_size = 1024 * 1024, -- 1MB
        error_sign = true,
        duration = 200,
        delay = 300,
    }

    local line_num_conf = {
        enable = true,
        style = "#E8E3E3",
        priority = 10,
        use_treesitter = false,
    }

    local blank_conf = {
        enable = true,
        priority = 9,
        chars = { "⁘", "⁙" },
        style = "#1f1f1f",
    }

    local indent_conf = {
        enable = true,
        chars = {
            "⁘",
        },
        style = {
            "#1f1f1f",
        },
    }

    require('hlchunk').setup({
        chunk = chunk_conf,
        line_num = line_num_conf,
        blank = blank_conf,
        indent = indent_conf,  -- Corrected typo
        -- you can add more configurations here
    })
  '';
}
