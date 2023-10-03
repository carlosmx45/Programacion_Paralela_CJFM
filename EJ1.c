//Multiplicación de Matrices
#include <stdio.h>
#include <stdlib.h>

//Matrices
int mat1[10][10], mat2[10][10], mat3[10][10];

int main()
{
	//Inicializar Matriz
	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			mat1[i][j] = rand() % 10 + 1;
			mat2[i][j] = rand() % 10 + 1;
		}
	}

	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			mat3[i][j] = 0; //Inicializar valor de matriz

			for (int k = 0; k < 10; k++)
			{
				//Sumatoria de valores multiplicados
				mat3[i][j] += mat1[i][k] * mat2[k][j];
			}
		}
	}

	//Imprimir resultado matriz
	for (int i = 0; i < 10; i++) 
	{
		for (int j = 0; j < 10; j++)
		{
			printf("Valor en [%d][%d]: %d \n", i, j, mat3[i][j]);
		}
	}
}
