import pygame
import os
from pygame.locals import *


wb='c:/Users/thomas/Dropbox/current_zazanim_projects/jcvd2047/'

pics=[
    "frame003.bmp",
    "frame004.bmp",
    "frame005.bmp",
##    "frame144.bmp",
##    "frame145.bmp"
    ]

colorkey=pygame.Color(10,200,200,255)
x1=88
y1=48
x2=438
y2=422

w=x2-x1
h=y2-y1

target=[
        {"name":"left","area":pygame.Rect(x1,y1,x2-x1,y2-y1),"invert":True,"scale":True  },
        {"name":"right","area":pygame.Rect(x1,y1,x2-x1,y2-y1),"scale":True  },
##        {"name":"down","area":pygame.Rect(232,80,178,349-80)  },
##        {"name":"up","area":pygame.Rect(x1,y1,x2-x1,y2-y1),"invert":True  },
##        {"name":"right","area":pygame.Rect(x1,y1,x2-x1,y2-y1),'rotate':90  },
##        {"name":"left","area":pygame.Rect(x1,y1,x2-x1,y2-y1) ,'rotate':270 }
    ]


tgtheight=128
tgtwidth=int(tgtheight*w/h)

pygame.init()
i=1
for pic in pics:
    print( pic )
    src=pygame.image.load(wb+pic)
    src.set_colorkey(colorkey)
    for tgt in target:
        print(tgt)
        tgtsurf=pygame.Surface((tgt["area"].w,tgt["area"].h))
        tgtsurf.blit(src,(0,0),tgt["area"])
        if "invert" in tgt :
            tgtsurf=pygame.transform.flip(tgtsurf,True,False)

        if "scale" in tgt:
            tgtsurf=pygame.transform.scale(tgtsurf,(tgtwidth,tgtheight))

        if 'rotate' in tgt:
            tgtsurf=pygame.transform.scale(tgtsurf,(h,h))
            tgtsurf=pygame.transform.rotate(tgtsurf,tgt['rotate'])
            tgtsurf=pygame.transform.scale(tgtsurf,(h,w))
            tgtsurf=pygame.transform.scale(tgtsurf,(tgtheight,tgtwidth))
            
##            tgtsurf=pygame.transform.rotozoom(tgtsurf,tgt['rotate'],1)
        
        pygame.image.save(tgtsurf,tgt["name"]+str(i)+".png")
        
    i=i+1
pygame.quit()
