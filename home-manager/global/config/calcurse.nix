{ config, pkgs, ... }:

{

  home.file.".config/calcurse/conf" = {
    text = ''
appearance.calendarview=monthly
appearance.compactpanels=no
appearance.defaultpanel=calendar
appearance.layout=7
appearance.headerline=yes
appearance.eventseparator=yes
appearance.dayseparator=yes
appearance.emptyline=yes
appearance.emptyday=--
appearance.notifybar=yes
appearance.sidebarwidth=0
appearance.theme=magenta on default
appearance.todoview=hide-completed
appearance.headingpos=right-justified
daemon.enable=no
daemon.log=no
format.inputdate=1
format.notifydate=%a %F
format.notifytime=%T
format.outputdate=%D
format.dayheading=%B %e, %Y
general.autogc=no
general.autosave=yes
general.confirmdelete=yes
general.confirmquit=yes
general.firstdayofweek=monday
general.multipledays=yes
general.periodicsave=0
general.systemevents=yes
notification.command=printf '\a'
notification.notifyall=flagged-only
notification.warning=300
format.appointmenttime=%H:%M
'';
  };

}