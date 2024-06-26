{
  style = 
#css
  ''

  @define-color backgroundlight #DDEEFF;
  @define-color backgrounddark #FFFFFF;
  @define-color workspacesbackground1 #DDEEFF;
  @define-color workspacesbackground2 #CCCCCC;
  @define-color hovercolor #EEEEFF;
  @define-color bordercolor #DDEEFF; @define-color textcolor1 #000000;
  @define-color textcolor2 #000000;
  @define-color textcolor3 #FFFFFF;
  @define-color iconcolor #EEEEFF;

  /* -----------------------------------------------------
   * General 
   * ----------------------------------------------------- */

  * {
    font-family: "JetBrainsMonoNerdFont";
border: none;
        border-radius: 0px;
  }

  window#waybar {
    background-color: rgba(0,0,0,0.1);
    border-bottom: 0px solid #ffffff;
    /* color: #FFFFFF; */
    transition-property: background-color;
    transition-duration: .5s;
  }

  /* -----------------------------------------------------
   * Workspaces 
   * ----------------------------------------------------- */

#workspaces {
    margin: 5px 1px 6px 1px;
    padding: 0px 1px;
    border-radius: 15px;
    border: 0px;
    font-weight: bold;
    font-style: normal;
    font-size: 16px;
    color: @textcolor1;
    }

    #workspaces button {
      padding: 0px 5px;
      margin: 4px 3px;
      border-radius: 15px;
      border: 0px;
      background: @workspacesbackground2;
      color: @textcolor3;
      transition: all 0.3s ease-in-out;
    }

    #workspaces button.active {
      color: @textcolor1;
      background: @workspacesbackground1;
      border-radius: 15px;
      min-width: 40px;
      transition: all 0.3s ease-in-out;
    }

    #workspaces button:hover {
      color: @textcolor1;
      background: @hovercolor;
      border-radius: 15px;
    }

    /* -----------------------------------------------------
     * Tooltips
     * ----------------------------------------------------- */

    tooltip {
      border-radius: 10px;
      background-color: @backgroundlight;
      opacity:0.8;
      padding:20px;
      margin:0px;
    }

    tooltip label {
    color: @textcolor2;
    }

    /* -----------------------------------------------------
     * Window
     * ----------------------------------------------------- */

#window {
    background: none;
    margin: 10px 15px 10px 0px;
    padding: 2px 10px 0px 10px;
             border-radius: 12px;
    color:@textcolor2;
          font-size:16px;
          font-weight:normal;
    }

    window#waybar.empty #window {
      background-color:transparent;
    }


    /* -----------------------------------------------------
     * Modules
     * ----------------------------------------------------- */

    .modules-left > widget:first-child > #workspaces {
      margin-left: 0;
    }

    .modules-right > widget:last-child > #workspaces {
      margin-right: 0;
    }

    /* -----------------------------------------------------
     * Idle Inhibator
     * ----------------------------------------------------- */

#idle_inhibitor {
    margin: 0px 15px;
            font-size: 22px;
            font-weight: bold;
    opacity: 0.8;
    color: @iconcolor;
    background: none;
    }

#idle_inhibitor.activated {
    margin: 0px 15px;
            font-size: 20px;
            font-weight: bold;
    opacity: 0.8;
    color: #dc2f2f;
    }

    /* -----------------------------------------------------
     * Custom Modules
     * ----------------------------------------------------- */

    #custom-appmenu {
      background-color: @workspacesbackground1;
      font-size: 16px;
      color: @textcolor1;
      border-radius: 15px;
      padding: 2px 10px 0px 10px;
      margin: 10px 15px 10px 15px;
    }
    #custom-appmenu.hover {
      background-color: @hovercolor;
    }


    /* -----------------------------------------------------
     * Custom Exit
     * ----------------------------------------------------- */

#custom-exit {
    margin: 0px 20px 0px 0px;
    padding:0px;
            font-size:20px;
    color: @iconcolor;
    }


    /* -----------------------------------------------------
     * Clock
     * ----------------------------------------------------- */

#clock {
    background: none;
    font-size: 18px;
    font-weight: 800;
    color: @textcolor1;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 8px 15px 8px 0px;
    }

    /* -----------------------------------------------------
     * Pulseaudio
     * ----------------------------------------------------- */

#pulseaudio {
      background-color: @backgroundlight;
      font-size: 16px;
    color: @textcolor2;
           border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
    }

#pulseaudio.muted {
      background-color: @backgrounddark;
    color: @textcolor1;
    }

    /* -----------------------------------------------------
     * Network
     * ----------------------------------------------------- */

#network {
      background-color: @backgroundlight;
      font-size: 16px;
    color: @textcolor2;
           border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
    }

#network.ethernet {
      background-color: @backgroundlight;
    color: @textcolor2;
    }

#network.wifi {
      background-color: @backgroundlight;
    color: @textcolor2;
    }

    /* -----------------------------------------------------
     * Bluetooth
     * ----------------------------------------------------- */

#bluetooth, #bluetooth.on, #bluetooth.connected {
      background-color: @backgroundlight;
      font-size: 16px;
    color: @textcolor2;
           border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 10px 15px 10px 0px;
    }

#bluetooth.off {
      background-color: transparent;
    padding: 0px;
    margin: 0px;
    }

    /* -----------------------------------------------------
     * Battery
     * ----------------------------------------------------- */

    #battery {
      background-color: @backgroundlight;
      font-size: 16px;
    color: @textcolor2;
           border-radius: 15px;
    padding: 2px 15px 0px 10px;
    margin: 10px 15px 10px 0px;
    }

    #battery.charging, #battery.plugged {
    color: @textcolor2;
           background-color: @backgroundlight;
    }

    @keyframes blink {
      to {
        background-color: @backgroundlight;
    color: @textcolor2;
      }
    }

    #battery.critical:not(.charging) {
      background-color: #f53c3c;
    color: @textcolor3;
           animation-name: blink;
           animation-duration: 0.5s;
           animation-timing-function: linear;
           animation-iteration-count: infinite;
           animation-direction: alternate;
    }


    /* -----------------------------------------------------
     * Other
     * ----------------------------------------------------- */

    label:focus {
            background-color: #000000;
          }

    #network {
      background-color: #2980b9;
    }

    #network.disconnected {
      background-color: #f53c3c;
    }
    '';
}
