function rval=FillInSingletons(Puzzle)

% Loop through each case and test if there is only one value
% This is a primitive search and could certainly be expanded
for xcounter = 1:9
  for ycounter = 1:9
    if (Puzzle(xcounter, ycounter) == 0)
      % Create an array of possible numbers
      PossibleNumbers = [1:9];
      % Also, create an array of the indices that inner square could be
      xstart = 1 + 3 * idivide(xcounter - 1, 3);
      ystart = 1 + 3 * idivide(ycounter - 1, 3);
      [SmallGridX, SmallGridY] = meshgrid([xstart:xstart+2], [ystart:ystart+2]);
      for PointsCounter = 1:9
        for NumbersCounter = 1:9
          if (Puzzle(PointsCounter, ycounter) == PossibleNumbers(NumbersCounter))
            PossibleNumbers(NumbersCounter) = 0;
          elseif (Puzzle(xcounter, PointsCounter) == PossibleNumbers(NumbersCounter))
            PossibleNumbers(NumbersCounter) = 0;
          elseif (Puzzle(SmallGridX(PointsCounter), SmallGridY(PointsCounter)) == PossibleNumbers(NumbersCounter))
            PossibleNumbers(NumbersCounter) = 0;
          endif
        endfor
      endfor
      if (sum(PossibleNumbers) == 0)
        rval = [];
        return
      endif
      if (sum(PossibleNumbers) == max(PossibleNumbers))
        Puzzle(xcounter, ycounter) = max(PossibleNumbers);
      endif
    endif
  endfor
endfor

rval = Puzzle;

endfunction

          
