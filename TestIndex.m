function rval=TestIndex(Puzzle, x, y)

% Start with an assumed true case
rval = 1;

% First, test whether the number fits in the column
for xcounter = 1:9
  if (xcounter ~= x)
    if (Puzzle(xcounter, y) == Puzzle(x,y))
      %keyboard
      rval = 0;
      return
    endif
  endif
endfor

% Now test whether the number fits in the row
for ycounter = 1:9
  if (ycounter ~= y)
    if (Puzzle(x, ycounter) == Puzzle(x,y))
      %keyboard
      rval = 0;
      return
    endif
  endif
endfor

% Now determine the bounds of the smaller square
%x
%y
xstart = 1 + 3 * idivide(x - 1, 3);
%ceil((x) / 3)
ystart = 1 + 3 * idivide(y - 1, 3);
%ceil((y) / 3)

for (xcounter = xstart:xstart+2)
  if (xcounter ~= x)
    for (ycounter = ystart:ystart+2)
      if (ycounter ~= y)
        if (Puzzle(xcounter, ycounter) == Puzzle(x,y))
          %keyboard
          rval = 0;
          return
        endif
      endif
    endfor
  endif
endfor

endfunction
