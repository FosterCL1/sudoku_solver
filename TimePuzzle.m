LoadPuzzle
disp "Without singletons"
tic
TryNextOpenSlot(NewPuzzle)
toc
disp "With singletons"
tic
TryNextOpenSlotWithSingletons(NewPuzzle)
toc

