{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "nabla.nvim";
      version = "2023-12-23";
      src = pkgs.fetchFromGitHub {
        owner = "jbyuki";
        repo = "nabla.nvim";
        rev = "27a6ea9ed7452bb9e0b19eb0942b5bcf7d051b2f";
        hash = "sha256-4M2IFzgJupw7bUqdDqoAhZOgW96BeowjhbHzpYw2zbY=";
      };
    })
  ];

  extraConfigLua = ''
    vim.api.nvim_set_keymap('n', '<leader>p', ':lua require("nabla").popup()<CR>', { noremap = true, silent = true })
    require('nabla').enable_virt({
    conceal_char = " ",
    autogen = true, -- auto-regenerate ASCII art when exiting insert mode
    silent = true,     -- silents error messages
    })
  '';
}