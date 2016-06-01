script "com.livecode.widget.fivestar.__DefaultScript"
--
on mouseDown
   local tAmountStars
   put 0.0 into tAmountStars
   put (item 1 of the clickloc ) - ( the left of me) into starPickLoc
   put trunc( the width of me / 10 ) into halfStarAmnt
   switch 
      case starPickLoc < halfStarAmnt
         put 0.5 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 2)
         put 1.0 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 3)
         put 1.5 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 4)
         put 2.0 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 5)
         put 2.5 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 6)
         put 3.0 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 7)
         put 3.5 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 8)
         put 4.0 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 9)
         put 4.5 into tAmountStars
         break
      case starPickLoc < (halfStarAmnt * 10)
         put 5.0 into tAmountStars
         break
      default
         break
   end switch
   set the amountOfStars of me to tAmountStars
   put the mouseLoc into theStartLoc
   set the numberformat to 0
   put (the round of (the width of me))/10 into moveTolerance
   set the numberformat to 0.0
   repeat until the mouse is "up"
      get the mouseLoc
      if item 1 of it > ((item 1 of theStartLoc)+moveTolerance) then 
         put it into theStartLoc
         add 0.5 to tAmountStars
         if tAmountStars >= 5 then 
            put 5.0 into tAmountStars
         end if
         set the amountOfStars of me to tAmountStars
      end if
      if item 1 of it < ((item 1 of theStartLoc)-moveTolerance) then
         put it into theStartLoc
         subtract 0.5 from tAmountStars
         if tAmountStars <= 0 then 
            put 0 into tAmountStars
         end if
         set the amountOfStars of me to tAmountStars
      end if
   end repeat
end mouseDown
