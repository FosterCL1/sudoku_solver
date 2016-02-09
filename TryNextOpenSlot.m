function rval=TryNextOpenSlot(Puzzle)

rval = [];
availablex = 0;
availabley = 0;

% Find the first available square
for (xcounter=1:9)
  if (availablex == 0 && availabley == 0)
    for (ycounter=1:9)
      if (availablex == 0 && availabley == 0)
        if (Puzzle(xcounter, ycounter) == 0)
          availablex = xcounter;
          availabley = ycounter;
        endif
      endif
    endfor
  endif
endfor

% Check if the puzzle has no empty squares. If so, we're done
if (availablex == 0 && availabley == 0)
  rval = Puzzle;
  return
endif

for icounter=1:9
  Puzzle(availablex, availabley) = icounter;
  if TestIndex(Puzzle, availablex, availabley)
    NewPuzzle = TryNextOpenSlot(Puzzle);
    if (size(NewPuzzle, 1) ~= 0)
      rval = NewPuzzle;
      return
    endif
  endif
endfor

endfunction
