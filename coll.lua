
--collides x,y,w,h
function coll(x1,y1,w1,h1,x2,y2,w2,h2)
 if 
  (
   ((x2<=x1+w1)and(x2>=x1))
   or
   ((x1<=x2+w2)and(x1>=x2))
  )
  and
  (
   ((y2<=y1+h1)and(y2>=y1))
    or
    ((y1<=y2+h2)and(y1>=y2))
  )  
 then    
    
  return true
 end
 
 return false
end