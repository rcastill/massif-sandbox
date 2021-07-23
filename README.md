# Memory Profiler Sandbox: Massif

Massif is a tool found in the [valgrind](https://valgrind.org/) suite. It is a memory profiler, it tells you how much memory was allocated and by whom (function).

This repo shows a minimal example: _transgressor.c_ will create 10 lists in the heap, also it will free the heap randomly.

## Requirements

1. Valgrind

    ```
    # On debian-based systems
    sudo apt install valgrind
    ```

2. Massif Visualizer (gui tool to analyze massif output)

    ```
    # On debian-based systems
    sudo apt install massif-visualizer
    ```

3. Make + gcc

    ```
    # On debian-based systems
    sudo apt install build-essential
    ```

## Test massif

The `massif` Makefile target will build _transgressor.c_, run `valgrind --tool=massif ./transgressor` and then show the results in `massif-visualizer`.

```bash
make massif
```
