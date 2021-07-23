#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int* give_me_a_sequence(int size)
{
    int* seq = (int*)malloc(sizeof(int)*size);
    for (int i = 0; i < size; i++)
        seq[i] = i + 1; 
    return seq;
}

void print_sequence(int const* seq, int size)
{
    if (seq == NULL)
        return;
    for (int i = 0; i < size; i++) {
        fprintf(stderr, "%d", seq[i]);
        if (i < size - 1)
            fprintf(stderr, ", ");
    }
    fprintf(stderr, "\n");
}

int main()
{
    srand(time(NULL));
    int size = 10;
    int* seq = NULL;
    for (int i = 0; i < 10; i++) {
        if (seq != NULL && rand() % 2)
            free(seq);
        seq = give_me_a_sequence(size);
    }
    print_sequence(seq, size);
    return 0;
}
