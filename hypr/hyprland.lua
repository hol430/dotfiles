-- Hyprland Lua configuration (Hyprland 0.55+)
-- Converted from hyprland.conf.bak; original settings retained where possible.
-- See https://wiki.hypr.land/Configuring/Start/

----------------
-- MONITORS --
----------------
-- Fallback for any monitor not explicitly listed in monitors.lua.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
require("monitors")

------------------
-- MY PROGRAMS --
------------------
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun -I"

---------------
-- AUTOSTART --
---------------
-- The hyprland.start event replaces exec-once; it is not rerun on config reload.
hl.on("hyprland.start", function()
    -- hl.exec_cmd(terminal)
    -- hl.exec_cmd("nm-applet")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wpaperd -d")
    -- Kept from the original config. xrandr is X11-oriented and does not
    -- designate the primary native Wayland output in Hyprland.
    hl.exec_cmd("xrandr --output DP-2 --primary")
    hl.exec_cmd("mullvad-vpn --disable-accelerated-video-decode")
    hl.exec_cmd("protonmail-bridge")
    hl.exec_cmd("seafile-applet")
    -- hl.exec_cmd("/home/drew/.bin/capture-login-slowdown.sh")
end)

---------------------------
-- ENVIRONMENT VARIABLES --
---------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRSHOT_DIR", "/home/drew/Pictures/Screenshots")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-----------------
-- PERMISSIONS --
-----------------
-- Permissions require a Hyprland restart; these were commented out originally.
-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-------------------
-- LOOK AND FEEL --
-------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true, -- Original: "yes, please :)"
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

----------------
-- ANIMATIONS --
----------------
-- Preserve the original Bézier control points and animation settings.
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 } } })
hl.curve("almostLinear",  { type = "bezier", points = { { 0.5, 0.5 },   { 0.75, 1 } } })
hl.curve("quick",         { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 } } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-----------------------
-- INPUT AND GESTURES --
-----------------------
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Example device-specific rule from the original config.
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

-----------------
-- KEYBINDINGS --
-----------------
local mainMod = "SUPER"

-- Programs and window actions.
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- Preserves the previous exit behavior; use `hl.dsp.exec_cmd("uwsm stop")`
-- here instead if your session is managed with uwsm.
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- Original layoutmsg bind had no argument; use the official dwindle toggle.
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
-- Original `fullscreen, 1` was maximize (preserve bars/gaps), not true fullscreen.
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Directional focus.
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch to workspaces 1-10, or move the current window there with Shift.
for i = 1, 10 do
    local key = i % 10 -- Workspace 10 is the 0 key.
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Named special workspace (scratchpad).
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Custom workspace navigation scripts (same paths/arguments as before).
hl.bind("SUPER + ALT + left",  hl.dsp.exec_cmd("~/.config/hypr/scripts/workspaces prev"))
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/workspaces next"))
hl.bind("SUPER + ALT + HOME",  hl.dsp.exec_cmd("~/.config/hypr/scripts/workspaces first"))
hl.bind("SUPER + ALT + END",   hl.dsp.exec_cmd("~/.config/hypr/scripts/workspaces last"))

-- Cycle existing workspaces with Super + scroll.
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move and resize with Super + left/right mouse drag.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio and brightness (old bindel = locked + repeating).
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media keys (old bindl = locked, without repeat).
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshots. The original used an undefined `$shiftMod` for region capture;
-- interpret that as the Shift key, as intended.
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("Print",               hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + Print",       hl.dsp.exec_cmd("hyprshot -m region"))

-- Lock screen.
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-------------------------
-- WINDOWS / WORKSPACES --
-------------------------
-- The commented-out "smart gaps" examples in the original config remain
-- disabled. To enable them, port them using hl.workspace_rule()/hl.window_rule().
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "smart-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "smart-gaps-f1", match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 })

-- Suppress maximize requests from apps.
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- XWayland drag-focus workaround.
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "move-mullvad-to-workspace-4",
    match = { class = "Mullvad VPN" },
    workspace = "4 silent",
    no_max_size = true,
    tile = true, -- Old `float = off`.
    pseudo = true,
})

hl.window_rule({
    name = "move-protonmail-bridge-to-workspace-4",
    match = { class = "ch.proton.bridge-gui" },
    workspace = "4 silent",
    tile = true, -- Old `float = no`.
    pseudo = true,
})

hl.window_rule({
    name = "fullscreen-terraria",
    match = { class = "^dotnet$", title = "^Terraria:.*" },
    fullscreen = true,
    confine_pointer = true,
})

hl.window_rule({
    name = "steam-nofloat",
    match = { class = "steam" },
    tile = true, -- Old `float = off`.
})

hl.window_rule({
    name = "move-seafile-to-workspace-4",
    match = { class = "com.seafile.seafile-applet" },
    workspace = "4 silent",
})

hl.window_rule({
    name = "fullscreen-ftl",
    match = { class = "FTL.amd64" },
    fullscreen = true,
})

hl.window_rule({
    name = "fullscreen-kotor2",
    match = { class = "KOTOR2" },
    fullscreen = true,
    monitor = "DP-2",
})
