''
configuration {
    show-icons:                     false;
    display-drun: 		            "";
    drun-display-format:            "{icon} {name}";
    disable-history:                false;
    click-to-exit: 		            true;
    location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
    transparency:                   "real";
    background-color:               @BG;
    text-color:                     @FG;
    border:                         2px;
    border-color:                   @BDR;
    border-radius:                  10px;
    width:                          400px;
    anchor:                         center;
    x-offset:                       0;
    y-offset:                       0;
}

prompt {
    enabled: 			            true;
    margin: 			            0px 8px 0px 8px;
    padding: 			            8px;
    background-color: 		        @IMG;
    text-color: 		            @BG;
    border:                  	    0px 0px 0px 0px;
    border-color:                   @BDR;
    border-radius:                  10px;
}

textbox-prompt-colon {
    expand: 			            false;
    str: 			                "直";
    border-radius:                  100%;
    background-color:               @SEL;
    text-color:                     @FG;
    padding:                        8px 12px 8px 12px;
    font:			                "Fira Code Nerd Font 10";
}

entry {
    background-color:               @BG;
    text-color:                     @FG;
    placeholder-color:              @FG;
    expand:                         true;
    horizontal-align:               0;
    placeholder:                    "";
    blink:                          true;
    border:                  	    0px 0px 2px 0px;
    border-color:                   @BDR;
    border-radius:                  10px;
    padding:                        8px;
}

inputbar {
    children: 		                [ textbox-prompt-colon, prompt, entry ];
    background-color:               @BG;
    text-color:                     @FG;
    expand:                         false;
    border:                  	    0px 0px 0px 0px;
    border-radius:                  0px;
    border-color:                   @BDR;
    margin:                         0px 0px 0px 0px;
    padding:                        0px;
    position:                       center;
}

case-indicator {
    background-color:               @BG;
    text-color:                     @FG;
    spacing:                        0;
}


listview {
    background-color:               @BG;
    columns:                        1;
    lines:			                7;
    spacing:                        4px;
    cycle:                          true;
    dynamic:                        true;
    layout:                         vertical;
}

mainbox {
    background-color:               @BG;
    children:                       [ inputbar, listview ];
    spacing:                        15px;
    padding:                        15px;
}

element {
    background-color:               @BG;
    text-color:                     @FG;
    orientation:                    horizontal;
    border-radius:                  4px;
    padding:                        6px 6px 6px 6px;
}

element-icon {
    background-color: 	            inherit;
    text-color:       		        inherit;
    size:                           0px;
    border:                         0px;
}

element-text {
    background-color: 	            inherit;
    text-color:       		        inherit;
    expand:                         true;
    horizontal-align:               0;
    vertical-align:                 0.5;
    margin:                         2px 0px 2px 6px;
}

element normal.urgent,
element alternate.urgent {
    background-color:               @UGT;
    text-color:                     @FG;
    border-radius:                  9px;
}

element normal.active,
element alternate.active {
    background-color:               @BGA;
    text-color:                     @FG;
}

element selected {
    background-color:               @BGA;
    text-color:                     @SEL;
    border:                  	    0px 0px 0px 0px;
    border-radius:                  10px;
    border-color:                   @BDR;
}

element selected.urgent {
    background-color:               @UGT;
    text-color:                     @FG;
}

element selected.active {
    background-color:               @BGA;
    color:                          @FG;
}
''
