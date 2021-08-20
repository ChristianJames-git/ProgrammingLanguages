#include <stdio.h>

int main(int argc, char* argv[])
{
    FILE * database;
    char buffer[30];

    database = fopen(argv[1], "r");

    if (NULL == database)
    {
         perror("opening database");
         return (-1);
    }

    while (EOF != fscanf(database, "%[^\n]\n", buffer))
    {
         printf("> %s\n", buffer);
    }

    fclose(database);
    return (0);
}