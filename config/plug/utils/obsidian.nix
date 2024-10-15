{ config, lib, ... }:
{
  plugins = {
    obsidian = {
      enable = false;

      settings = {
        ui = {
          enable = true;
        };
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        workspaces = [
          {
            name = "default";
            path = "~/obsidian/vault/";
          }
        ];
        new_notes_location = "current_dir";
        notes_subdir = "notes";
        daily_notes = {
          template = "~/obsidian/templates/daily_note_template.md";
          folder = "work/daily_notes";
        };
        mappings = {
          gf = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              noremap = false;
              expr = true;
              buffer = true;
            };
          };
          "<leader>ch" = {
            action = "require('obsidian').util.toggle_checkbox";
            opts.buffer = true;
          };
        };
        templates = {
          subdir = "~/obsidian/templates";
          substitutions = {
            monday.__raw = ''
              function()
                  -- Get the current date
                  local currentDate = os.date("*t")

                  -- Calculate the difference in days to the first day of the week (Monday)
                  local diff = (currentDate.wday + 5) % 7

                  -- Subtract the difference to get the date of the first day of the week
                  currentDate.day = currentDate.day - diff

                  -- Return the date of the first day of the week
                  return os.date("%Y-%m-%d", os.time(currentDate))
              end
            '';
            tuesday.__raw = ''
              function()
                  -- Get the current date
                  local currentDate = os.date("*t")

                  -- Calculate the difference in days to the first day of the week (Monday)
                  local diff = (currentDate.wday + 4) % 7

                  -- Subtract the difference to get the date of the first day of the week
                  currentDate.day = currentDate.day - diff

                  -- Return the date of the first day of the week
                  return os.date("%Y-%m-%d", os.time(currentDate))
              end
            '';
            wednesday.__raw = ''
              function()
                  -- Get the current date
                  local currentDate = os.date("*t")

                  -- Calculate the difference in days to the first day of the week (Monday)
                  local diff = (currentDate.wday + 3) % 7

                  -- Subtract the difference to get the date of the first day of the week
                  currentDate.day = currentDate.day - diff

                  -- Return the date of the first day of the week
                  return os.date("%Y-%m-%d", os.time(currentDate))
              end
            '';
            thursday.__raw = ''
              function()
                  -- Get the current date
                  local currentDate = os.date("*t")

                  -- Calculate the difference in days to the first day of the week (Monday)
                  local diff = (currentDate.wday + 2) % 7

                  -- Subtract the difference to get the date of the first day of the week
                  currentDate.day = currentDate.day - diff

                  -- Return the date of the first day of the week
                  return os.date("%Y-%m-%d", os.time(currentDate))
              end
            '';
            friday.__raw = ''
              function()
                  -- Get the current date
                  local currentDate = os.date("*t")

                  -- Calculate the difference in days to the first day of the week (Monday)
                  local diff = (currentDate.wday + 1) % 7

                  -- Subtract the difference to get the date of the first day of the week
                  currentDate.day = currentDate.day - diff

                  -- Return the date of the first day of the week
                  return os.date("%Y-%m-%d", os.time(currentDate))
              end
            '';
          };
        };
      };
    };
  };
}
