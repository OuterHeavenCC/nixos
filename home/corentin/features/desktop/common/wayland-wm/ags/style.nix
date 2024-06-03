{ config, ... }:

''
  /* style aggregator */
  /* setup */
  /* get rid of GTK theme's styles and set defaults */
  * {
    all: unset;
    font-family: Inter, Roboto, sans-serif;
  }

  /* buttons */
  * {
    text-shadow: 0 2px 3px rgba(0, 0, 0, 0.2);
  }

  /* general styles */
  * {
    color: #ffffff;
  }

  /* mixins */
  tooltip {
    background: #000000;
    box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.1), 0 0 rgba(0, 0, 0, 0.4);
    border-radius: 8px;
  }

  /* scales & progress bars */
  scale trough,
  progressbar trough {
    background-color: rgba(255, 255, 255, 0.15);
    border-radius: 0.5rem;
    min-width: 5rem;
    padding: 0 0.25rem;
  }
  scale highlight,
  scale progress,
  progressbar highlight,
  progressbar progress {
    background: rgba(255, 255, 255, 0.7);
    border-radius: 0.5rem;
    margin: 0 calc(0px - 0.25rem);
    min-height: 0.5rem;
  }

  .button {
    transition: 200ms;
    background: #${config.lib.stylix.colors.base0F};
    border-radius: 5rem;
    padding: 0.4rem;
  }
  .button:hover {
    background: #${config.lib.stylix.colors.base0E};
  }

  .button.disabled {
    transition: 200ms;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 5rem;
    padding: 0.4rem;
  }
  .button.disabled:hover {
    background: rgba(255, 255, 255, 0.25);
  }

  /* modules & windows */
  .bar {
    background: rgba(0, 0, 0, 0.21);
    min-height: 32px;
  }
  .bar .module {
    margin: 0 0.5rem;
  }

  /* workspaces */
  .bar .workspaces {
    margin: 0.2rem 0.5rem;
  }
  .bar .workspaces button {
    background: rgba(0, 0, 0, 0.3);
    border-radius: 2rem;
    margin: 0.7rem 0.2rem;
    min-width: 1rem;
    transition: 100ms linear;
  }
  .bar .workspaces .focused {
    min-width: 2rem;
  }
  .bar .workspaces .monitor0 {
    background: #${config.lib.stylix.colors.base08};
  }
  .bar .workspaces .monitor1 {
    background: #${config.lib.stylix.colors.base0A};
  }
  .bar .workspaces .monitor2 {
    background: #${config.lib.stylix.colors.base0B};
  }
  .bar .workspaces .monitor3 {
    background: #${config.lib.stylix.colors.base0D};
  }

  /* music */
  .bar .music > box {
    transition: 200ms;
    border-radius: 16px;
    margin: 0.4rem;
  }
  .bar .music.active > box {
    background: rgba(255, 255, 255, 0.15);
  }
  .bar .music .cover {
    background-size: cover;
    background-position: center;
    border-radius: 50%;
    min-width: 2rem;
    min-height: 2rem;
  }

  /* tray */
  .tray button {
    transition: 200ms;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 5rem;
    padding: 0.4rem;
    background: none;
    margin: 0.5rem 0;
  }
  .tray button:hover {
    background: rgba(255, 255, 255, 0.25);
  }
  .tray button:not(:last-child) {
    margin-right: 0.3rem;
  }
  .tray button.active {
    background: rgba(255, 255, 255, 0.15);
  }

  menu {
    background: #000000;
    border-radius: 8px;
  }
  menu separator {
    background-color: rgba(255, 255, 255, 0.15);
  }
  menu menuitem {
    transition: 200ms;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 5rem;
    padding: 0.4rem;
    border-radius: 0;
    padding: 0.4rem 0.7rem;
  }
  menu menuitem:hover {
    background: rgba(255, 255, 255, 0.25);
  }
  menu menuitem:first-child {
    border-radius: 8px 8px 0 0;
  }
  menu menuitem:last-child {
    border-radius: 0 0 8px 8px;
  }
  menu menuitem:only-child {
    border-radius: 8px;
  }

  /* system-info */
  .bar .system-info {
    margin: 0 0.2rem;
  }
  .bar .system-info > box {
    margin: 0 0.3rem;
  }
  .bar .system-info .type {
    font-size: 0.55rem;
    font-weight: 300;
  }
  .bar .system-info .value {
    font-size: 0.8rem;
  }

  .system-menu-toggler box {
    transition: 200ms;
    margin: 0.4rem 0;
    border-radius: 16px;
  }
  .system-menu-toggler.active box {
    background: rgba(255, 255, 255, 0.15);
  }

  .music.window {
    box-shadow: 0 3px 5px 1px rgba(0, 0, 0, 0.3);
    border-radius: 16px;
    background: rgba(0, 0, 0, 0.3);
    margin: 5px 10px 15px;
    padding: 0.4rem;
  }
  .music.window .cover {
    background-position: center;
    background-size: cover;
    border-radius: 8px;
    box-shadow: 0 1px 2px -1px rgba(0, 0, 0, 0.3);
    margin: 0.4rem;
    min-height: 13rem;
    min-width: 13rem;
  }

  .music.window .info {
    margin: 0.5rem;
  }
  .music.window .info label,
  .music.window .info scale {
    margin: 0.3rem 0;
  }
  .music.window .info label.position,
  .music.window .info label.length {
    font-size: 0.8rem;
    margin-bottom: 0;
  }
  .music.window .info scale {
    margin-top: 0;
    margin-bottom: 0;
  }
  .music.window .info .title {
    font-size: 1.5rem;
    font-weight: bold;
    min-width: 14rem;
  }

  .music.window .controls button {
    margin: 0 0.2rem;
    font-size: 1.5rem;
  }

  .music.window .player-info {
    margin-bottom: 0;
  }
  .music.window .player-info .player-icon {
    font-size: 1.2rem;
  }

  .osd {
    box-shadow: 0 3px 5px 1px rgba(0, 0, 0, 0.3);
    border-radius: 16px;
    background: rgba(0, 0, 0, 0.3);
    margin: 5px 10px 15px;
    padding: 0.4rem;
    border-radius: 3rem;
    box-shadow: none;
    margin-bottom: 5rem;
    padding: 0.5rem;
  }
  .osd image {
    font-size: 3rem;
    margin: 0.5rem;
  }
  .osd box {
    margin: 0.5rem;
  }
  .osd label {
    margin: 0 0 0.5rem;
  }
  .osd progressbar trough {
    margin: 0.5rem 0.5rem 0;
    min-width: 10rem;
  }

  /* general */
  .system-menu {
    box-shadow: 0 3px 5px 1px rgba(0, 0, 0, 0.3);
    border-radius: 16px;
    background: rgba(0, 0, 0, 0.3);
    margin: 5px 10px 15px;
    padding: 0.4rem;
    margin-top: 4px;
    margin-right: 4px;
  }
  .system-menu > box {
    border-radius: calc(16px - 0.4rem - 2px);
    background: rgba(255, 255, 255, 0.15);
    box-shadow: 0 1px 5px -5px rgba(0, 0, 0, 0.5);
    margin: 0.4rem;
    padding: 0.4rem;
  }

  /* toggles */
  .system-menu .toggle {
    min-width: 20rem;
  }
  .system-menu .toggle:not(:last-child) {
    margin-bottom: 0.3rem;
  }
  .system-menu .toggle .button {
    margin-right: 0.5rem;
  }

  /* power profiles */
  .system-menu .power-profiles {
    padding: 0;
  }
  .system-menu .power-profiles .current-profile {
    padding: 0.3rem;
  }
  .system-menu .power-profiles image,
  .system-menu .power-profiles label {
    margin: 0.3rem;
  }
  .system-menu .power-profiles .options {
    padding: 0;
  }
  .system-menu .power-profiles .options widget {
    transition: 200ms;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 5rem;
    padding: 0.4rem;
    border-radius: 0;
  }
  .system-menu .power-profiles .options widget:hover {
    background: rgba(255, 255, 255, 0.25);
  }
  .system-menu .power-profiles .options widget:last-child {
    border-radius: 0 0 8px 8px;
  }
  .system-menu .power-profiles .options widget box {
    padding: 0.3rem;
  }

  /* sliders */
  .system-menu .sliders image {
    margin: 0.3rem;
  }
  .system-menu .sliders scale {
    margin: 0 0.5rem;
  }

  .system-menu .battery-box image,
  .system-menu .battery-box label {
    margin: 0 0.3rem;
  }
  .system-menu .battery-box .time {
    color: rgba(255, 255, 255, 0.7);
  }

  .notification {
    box-shadow: 0 3px 5px 1px rgba(0, 0, 0, 0.3);
    border-radius: 16px;
    background: rgba(0, 0, 0, 0.3);
    margin: 5px 10px 15px;
    padding: 0.4rem;
    margin: 5px 5px 5px 10px;
    min-width: 25rem;
    border-radius: 16px;
    background-color: rgba(0, 0, 0, 0.3);
  }
  .notification.critical {
    border: 1px solid red;
  }

  .notifications widget:last-child .notification {
    margin-bottom: 15px;
  }

  .notification .icon image {
    font-size: 5rem;
    margin: 0.5rem;
    min-height: 5rem;
    min-width: 5rem;
  }
  .notification .icon > box {
    border-radius: 8px;
    margin: 0.5rem;
    min-height: 5rem;
    min-width: 5rem;
  }

  .notification .actions .action-button {
    border-radius: calc(16px - 0.4rem - 2px);
    background: rgba(255, 255, 255, 0.15);
    box-shadow: 0 1px 5px -5px rgba(0, 0, 0, 0.5);
    margin: 0.4rem;
    padding: 0.4rem;
    transition: 200ms;
    padding: 0.5rem 0;
  }
  .notification .actions .action-button:hover {
    background: rgba(255, 255, 255, 0.25);
  }

  .notification .text {
    margin: 0.5rem;
  }
  .notification .text .title {
    margin-bottom: 0.2rem;
    font-weight: 500;
  }
  .notification .text .body {
    color: rgba(255, 255, 255, 0.7);
    font-weight: 500;
  }

  /*# sourceMappingURL=style.css.map */
''
