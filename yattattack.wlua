--Yet Another Twitter, Tweeting, And Twitter-Tweeting-About Client Kangaroo

require "twitter"
require "iuplua"

entrywin=iup.dialog{
  title="Twitter Tweet (140)",
  iup.multiline{
    font="Consolas::10",
    size=tostring(72*4).."x20",
    action=function(self,c,value)
      entrywin.title="Twitter Tweet ("..140-#value..")"
    end,
    wordwrap="YES",
    scrollbar="NO",
    expand="YES"
  }
}

settings=iup.dialog{
  title="Yattattack Settings",
  iup.vbox{
    iup.hbox{
      iup.label{title="Minutes between feed updates: "},
      iup.text{}
    },
    iup.label{title="Twitter has a limit of 150 API requests per hour."}
  }
}


winlist={
  {"Entry",entrywin},
  {"Settings",settings}
}

buttans={}
for i,v in ipairs(winlist) do
  buttans[i]=iup.button{title=v[1], action=function() v[2]:show() end}
end

xylophone=iup.dialog{
  title="Low Commotion",
  iup.hbox(buttans)
}

xylophone:show()
iup.MainLoop()
