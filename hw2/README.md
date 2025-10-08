```
clang++ MyPass.cpp -fPIC -shared -I$(llvm-config --includedir) -o libPass.so
clang ../hw1/app.c -emit-llvm -S -fpass-plugin=./libPass.so -O2
clang ../hw1/start.c ../hw1/sim.c app.ll -lSDL2 log.c -O2
./a.out
```

---

# Statistics for 1'000'000 lines:

## Top 5 most frequent 1-line sequences:

- **222293**: 
```
[LOG] br <- icmp
```
- **222076**: 
```
[LOG] getelementptr <- add
```
- **111255**: 
```
[LOG] add <- add
```
- **111255**: 
```
[LOG] icmp <- add
```
- **111039**: 
```
[LOG] getelementptr <- alloca
```

## Top 5 most frequent 2-line sequences:

- **111255**: 
```
[LOG] br <- icmp
[LOG] add <- add
```
- **111255**: 
```
[LOG] add <- add
[LOG] icmp <- add
```
- **111255**: 
```
[LOG] icmp <- add
[LOG] br <- icmp
```
- **111038**: 
```
[LOG] getelementptr <- alloca
[LOG] getelementptr <- add
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] getelementptr <- add
```

## Top 5 most frequent 3-line sequences:

- **111255**: 
```
[LOG] br <- icmp
[LOG] add <- add
[LOG] icmp <- add
```
- **111255**: 
```
[LOG] add <- add
[LOG] icmp <- add
[LOG] br <- icmp
```
- **111038**: 
```
[LOG] getelementptr <- alloca
[LOG] getelementptr <- add
[LOG] getelementptr <- add
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] getelementptr <- add
[LOG] load <- getelementptr
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
```

## Top 5 most frequent 4-line sequences:

- **111255**: 
```
[LOG] br <- icmp
[LOG] add <- add
[LOG] icmp <- add
[LOG] br <- icmp
```
- **111038**: 
```
[LOG] getelementptr <- alloca
[LOG] getelementptr <- add
[LOG] getelementptr <- add
[LOG] load <- getelementptr
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
[LOG] br <- icmp
```
- **111038**: 
```
[LOG] load <- getelementptr
[LOG] icmp <- load
[LOG] br <- icmp
[LOG] add <- add
```

## Top 5 most frequent 5-line sequences:
- **111038**: 
```
[LOG] getelementptr <- alloca
[LOG] getelementptr <- add
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
[LOG] br <- icmp
```
- **111038**: 
```
[LOG] getelementptr <- add
[LOG] load <- getelementptr
[LOG] icmp <- load
[LOG] br <- icmp
[LOG] add <- add
```
- **111038**: 
```
[LOG] load <- getelementptr
[LOG] icmp <- load
[LOG] br <- icmp
[LOG] add <- add
[LOG] icmp <- add
```
- **111038**: 
```
[LOG] icmp <- load
[LOG] br <- icmp
[LOG] add <- add
[LOG] icmp <- add
[LOG] br <- icmp
```

---
