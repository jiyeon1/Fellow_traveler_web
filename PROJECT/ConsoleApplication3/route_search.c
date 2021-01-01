#include "project.h"
#include <stdlib.h>
#include <stdio.h>
#define SIZE 23  //ũ��

typedef struct Matrix {
	int row, col, value;
}Matrix;
typedef struct SP_Matrix {
	int rows, cols, terms;
	Matrix data[75];
}Sprsmtrx;


void search() {   //���Ž��
	int sel = 1; //�޴� �Է� ����
	int start_n, dstn_n; // ���,���� ��� ��ȣ
	int stack[23] = { -1, }; //��� ������ ���� stack
	char start_s[20], dstn_s[20]; //���,������ �̸� ����
	//������

	Sprsmtrx m = { 23,23,75,
	{ { 0,1,60 },{ 0,2,300 },{ 0,3,360 },{ 0,4,180 },{ 0,5,300 },
	{ 1,2,60 },{ 1,3,90 },{ 1,4,90 },{ 1,5,90 },
	{ 2,3,40 },{ 2,4,40 },{ 2,5,30 },
	{ 3,5,40 },
	{ 4,5,30 },{ 4,6,180 },
	{ 5,6,150 },{ 5,7,120 },
	{ 6,7,20 },{ 6,8,80 },{ 6,9,80 },{ 6,10,150 },{ 6,11,180 },{ 6,12,100 },{ 6,13,80 },
	{ 7,8,100 },{ 7,9,60 },{ 7,10,130 },{ 7,11,160 },{ 7,12,90 },{ 7,13,80 },
	{ 8,9,80 },{ 8,10,150 },{ 8,11,190 },{ 8,12,110 },{ 8,13,50 },{ 8,15,120 },{ 8,16,160 },{ 8,18,185 },{ 8,20,150 },{ 8,21,155 },{ 8,22,175 },
	{ 9,10,30 },{ 9,11,45 },{ 9,12,30 },{ 9,13,35 },{ 9,15,110 },{ 9,16,150 },
	{ 10,11,30 },{ 10,12,30 },{ 10,13,45 },
	{ 11,12,50 },
	{ 12,13,30 },{ 12,14,45 },{ 12,15,55 },{ 12,16,125 },
	{ 13,15,75 },{ 13,16,105 },
	{ 14,15,30 },
	{ 15,16,20 },
	{ 16,17,20 },{ 16,18,60 },{ 16,20,110 },{ 16,21,90 },{ 16,22,75 },
	{ 17,18,55 },{ 17,20,105 },{ 17,21,85 },{ 17,22,70 },
	{ 18,20,55 },{ 18,21,35 },{ 18,22,25 },
	{ 19,20,15 },
	{ 20,21,30 },{ 20,22,50 },
	{ 21,22,25 } } };
	int **map;//�Ϲ����
	//�������迭 �����Ҵ� 
	map = (int**)calloc(m.rows, sizeof(int*));
	for (int i = 0; i < m.rows; i++)
	{
		map[i] = (int*)calloc(m.cols, sizeof(int));
	}
	//�Ϲ���Ŀ� �����Ĵ���
	for (int i = 0; i < m.terms; i++)
	{
		map[m.data[i].row][m.data[i].col] = m.data[i].value;
	}
	//����� �׷����� ���� �ݺ���
	for (int i = 0; i < SIZE; i++) { 
		for (int j = i + 1; j < SIZE; j++) {
			map[j][i] = map[i][j];
		}
	}

	while (1) {
		printf("\n��������ġ�� �ǹ��̸� �Է� �� ");
		scanf("%s", &start_s); //����� �Է� 
							   // ��߰ǹ� �̸� ���ڿ��� �ش����� ���������� ��ȯ
		if (!strcmp(start_s, "�м���")) { start_n = 0; }
		else if (!strcmp(start_s, "��ȭ��")) { start_n = 1; }
		else if (!strcmp(start_s, "��ȸ���а�")) { start_n = 2; }
		else if (!strcmp(start_s, "�濵��")) { start_n = 3; }
		else if (!strcmp(start_s, "�ڹ���")) { start_n = 4; }
		else if (!strcmp(start_s, "��ȭ��")) { start_n = 5; }
		else if (!strcmp(start_s, "���а�")) { start_n = 6; }
		else if (!strcmp(start_s, "���ذ�")) { start_n = 7; }
		else if (!strcmp(start_s, "�����")) { start_n = 8; }
		else if (!strcmp(start_s, "������")) { start_n = 9; }
		else if (!strcmp(start_s, "���а�")) { start_n = 10; }
		else if (!strcmp(start_s, "��Ͽ�")) { start_n = 11; }
		else if (!strcmp(start_s, "�߾ӵ�����")) { start_n = 12; }
		else if (!strcmp(start_s, "����")) { start_n = 13; }
		else if (!strcmp(start_s, "�Ű��а�")) { start_n = 14; }
		else if (!strcmp(start_s, "�����")) { start_n = 15; }
		else if (!strcmp(start_s, "������ȭ��")) { start_n = 16; }
		else if (!strcmp(start_s, "�л�ȸ��")) { start_n = 17; }
		else if (!strcmp(start_s, "����B")) { start_n = 18; }
		else if (!strcmp(start_s, "�ݰ���")) { start_n = 19; }
		else if (!strcmp(start_s, "ü����")) { start_n = 20; }
		else if (!strcmp(start_s, "�и���")) { start_n = 21; }
		else if (!strcmp(start_s, "����A")) { start_n = 22; }
		else //�ǹ����� �߸� �Է� ���� ��� �ٽ� �Է� ����
		{
			start_n = -1;
			printf("\n�� ������� �߸� �Է��ϼ̽��ϴ�.\n");
			continue;
		}
		break;
	}
	while (1) {
		printf("\n������ �ǹ��̸� �Է� �� ");
		scanf("%s", &dstn_s);  //������ �Է� 
							   // ������ �ǹ��̸� ���ڿ��� �ش����� ���������� ��ȯ
		if (!strcmp(dstn_s, "�м���")) { dstn_n = 0; }
		else if (!strcmp(dstn_s, "��ȭ��")) { dstn_n = 1; }
		else if (!strcmp(dstn_s, "��ȸ���а�")) { dstn_n = 2; }
		else if (!strcmp(dstn_s, "�濵��")) { dstn_n = 3; }
		else if (!strcmp(dstn_s, "�ڹ���")) { dstn_n = 4; }
		else if (!strcmp(dstn_s, "��ȭ��")) { dstn_n = 5; }
		else if (!strcmp(dstn_s, "���а�")) { dstn_n = 6; }
		else if (!strcmp(dstn_s, "���ذ�")) { dstn_n = 7; }
		else if (!strcmp(dstn_s, "�����")) { dstn_n = 8; }
		else if (!strcmp(dstn_s, "������")) { dstn_n = 9; }
		else if (!strcmp(dstn_s, "���а�")) { dstn_n = 10; }
		else if (!strcmp(dstn_s, "��Ͽ�")) { dstn_n = 11; }
		else if (!strcmp(dstn_s, "�߾ӵ�����")) { dstn_n = 12; }
		else if (!strcmp(dstn_s, "����")) { dstn_n = 13; }
		else if (!strcmp(dstn_s, "�Ű��а�")) { dstn_n = 14; }
		else if (!strcmp(dstn_s, "�����")) { dstn_n = 15; }
		else if (!strcmp(dstn_s, "������ȭ��")) { dstn_n = 16; }
		else if (!strcmp(dstn_s, "�л�ȸ��")) { dstn_n = 17; }
		else if (!strcmp(dstn_s, "����B")) { dstn_n = 18; }
		else if (!strcmp(dstn_s, "�ݰ���")) { dstn_n = 19; }
		else if (!strcmp(dstn_s, "ü����")) { dstn_n = 20; }
		else if (!strcmp(dstn_s, "�и���")) { dstn_n = 21; }
		else if (!strcmp(dstn_s, "����A")) { dstn_n = 22; }
		else //�ǹ����� �߸� �Է� ���� ��� �ٽ� �Է� ����
		{
			dstn_n = -1;
			printf("\n�� �������� �߸� �Է��ϼ̽��ϴ�.\n");
			continue;
		}
		break;
	}

	if (start_n != -1 && dstn_n != -1) // ������� �������� �Է� ������ �˰��� ����
	{
		int dist[SIZE]; //�ǹ��� �ǹ� ������ �Ÿ� �ʱ�ȭ
		bool visit[SIZE];//�湮�� �ǹ����� Ȯ���ϱ� ���� �迭
		int prev[SIZE]; // �ش�ǹ��� �湮�ϱ� ������ �ǹ� ��ȣ�� �����ϴ� �迭


		for (int i = 0; i < SIZE; i++) //�迭 �ʱ�ȭ
		{
			dist[i] = INT_MAX;//������� ������ ��� ������ ���� �湮���� �ʾұ� ������ d[�ٸ����]=����(�ִ� ����)
			visit[i] = false;
			prev[i] = -1;
		}
		dist[start_n] = 0; // ������� �ʱ�ȭ

						   //�ִܰŸ� �Է�
		for (int count = 0; count < SIZE - 1; count++) // 0~22 -> 23
		{
			int min = INT_MAX;
			int min_index;
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && min > dist[v])//��尡 �湮�����ʾҰ� �ش���� ���۳�尣�� �Ÿ��� min���� ������
				{
					min_index = v; //�ε��� ����
					min = dist[v]; //�̴ϸغ��� ����
				}
			}
			//�ִܰŸ� ������Ʈ
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && map[min_index][v] && dist[min_index] != INT_MAX && dist[v] > dist[min_index] + map[min_index][v])
					//�ش��尡 �湮�����ʰ�, 
					//������ ������ �����ؾ��ϰ�, ���۳��� �ش�񱳳������� �Ÿ��� ������Ʈ �Ǿ����� 
				{
					dist[v] = dist[min_index] + map[min_index][v];
					prev[v] = min_index;//�ش��� ������带 prev�迭�� ����
				}
			}
			visit[min_index] = true; //�湮���� ó����.
		}


		printf("\n��%s���� %s������ �ð��� �� %d���Դϴ�.\n", start_s, dstn_s, dist[dstn_n]);
		printf("\n����� : ");
		int temp = dstn_n;//���������� ����ȣ �ӽ�����
		int i = 0;
		while (temp != -1) //prev��带 �������� ����ϱ����� stack�� ����
		{
			stack[i] = prev[temp]; //���ÿ� ����
			temp = prev[temp];//temp�� �� index�� prev������ ����
			i++;
		}
		i--;
		while (i != -1)//stack���� pop�ϴ� ������� ���.
		{
			switch (stack[i])
			{
			case 0:
				printf("�м��� �� ");
				i--;
				break;
			case 1: printf("��ȭ�� �� ");
				i--;
				break;
			case 2:
				printf("��ȸ���а� �� ");
				i--;
				break;
			case 3:
				printf("�濵�� �� ");
				i--;
				break;
			case 4:
				printf("�ڹ��� �� ");
				i--;
				break;
			case 5:
				printf("��ȭ�� �� ");
				i--;
				break;
			case 6:
				printf("���а� �� ");
				i--;
				break;
			case 7:
				printf("���ذ� �� ");
				i--;
				break;
			case 8:
				printf("����� �� ");
				i--;
				break;
			case 9:
				printf("������ �� ");
				i--;
				break;
			case 10:
				printf("���а� �� ");
				i--;
				break;
			case 11:
				printf("��Ͽ� �� ");
				i--;
				break;
			case 12:
				printf("�߾ӵ����� �� ");
				i--;
				break;
			case 13:
				printf("���� �� ");
				i--;
				break;
			case 14:
				printf("�Ű��а� �� ");
				i--;
				break;
			case 15:
				printf("����� �� ");
				i--;
				break;
			case 16:
				printf("������ȭ�� �� ");
				i--;
				break;
			case 17:
				printf("�л�ȸ�� �� ");
				i--;
				break;
			case 18:
				printf("����B �� ");
				i--;
				break;
			case 19:
				printf("�ݰ��� �� ");
				i--;
				break;
			case 20:
				printf("ü���� �� ");
				i--;
				break;
			case 21:
				printf("�и��� �� ");
				i--;
				break;
			case 22:
				printf("����A �� ");
				i--;
				break;
			case -1:
				i--;
				break;
			}
		}
		printf("%s\n", dstn_s); //���������� ���
	}
	for (int i = 0; i < m.rows; i++) {
		free(map[i]);
	}
	free(map);
}
void schedule_search(int start_n, int dstn_n, char* start_building_name, char* dstn_building_name) {  //�ð�ǥ�� ���� ��� Ž��
																									  //���, ���� ��� ��ȣ ����
	int sel = 1; //�޴� �Է� ����
	int stack[23] = { -1, }; //��� ������ ���� stack
							 //char start_building_name[20], dstn_building_name[20]; //���,������ �̸� ����
	//������
	Sprsmtrx m = { 23,23,75,
	{ { 0,1,60 },{ 0,2,300 },{ 0,3,360 },{ 0,4,180 },{ 0,5,300 },
	{ 1,2,60 },{ 1,3,90 },{ 1,4,90 },{ 1,5,90 },
	{ 2,3,40 },{ 2,4,40 },{ 2,5,30 },
	{ 3,5,40 },
	{ 4,5,30 },{ 4,6,180 },
	{ 5,6,150 },{ 5,7,120 },
	{ 6,7,20 },{ 6,8,80 },{ 6,9,80 },{ 6,10,150 },{ 6,11,180 },{ 6,12,100 },{ 6,13,80 },
	{ 7,8,100 },{ 7,9,60 },{ 7,10,130 },{ 7,11,160 },{ 7,12,90 },{ 7,13,80 },
	{ 8,9,80 },{ 8,10,150 },{ 8,11,190 },{ 8,12,110 },{ 8,13,50 },{ 8,15,120 },{ 8,16,160 },{ 8,18,185 },{ 8,20,150 },{ 8,21,155 },{ 8,22,175 },
	{ 9,10,30 },{ 9,11,45 },{ 9,12,30 },{ 9,13,35 },{ 9,15,110 },{ 9,16,150 },
	{ 10,11,30 },{ 10,12,30 },{ 10,13,45 },
	{ 11,12,50 },
	{ 12,13,30 },{ 12,14,45 },{ 12,15,55 },{ 12,16,125 },
	{ 13,15,75 },{ 13,16,105 },
	{ 14,15,30 },
	{ 15,16,20 },
	{ 16,17,20 },{ 16,18,60 },{ 16,20,110 },{ 16,21,90 },{ 16,22,75 },
	{ 17,18,55 },{ 17,20,105 },{ 17,21,85 },{ 17,22,70 },
	{ 18,20,55 },{ 18,21,35 },{ 18,22,25 },
	{ 19,20,15 },
	{ 20,21,30 },{ 20,22,50 },
	{ 21,22,25 } } };
	int **map;//�Ϲ����
	//�������迭 �����Ҵ� 
	map = (int**)calloc(m.rows, sizeof(int*));//23��
	for (int i = 0; i < m.rows; i++)//23��
	{
		map[i] = (int*)calloc(m.cols, sizeof(int));
	}
	//�Ϲ���Ŀ� �����Ĵ���
	for (int i = 0; i < m.terms; i++)
	{
		map[m.data[i].row][m.data[i].col] = m.data[i].value;
	}
	//����� �׷����� ���� �ݺ���
	for (int i = 0; i < SIZE; i++) { 
		for (int j = i + 1; j < SIZE; j++) {
			map[j][i] = map[i][j];
		}
	}

	if (start_n != -1 && dstn_n != -1) // ������� �������� �Է� ������ �˰��� ����
	{
		int dist[SIZE]; //���۳��� �� ��尣�� �ּҰŸ��� ������Ʈ�ϱ� ���� �迭
		bool visit[SIZE];//�湮�� ������� Ȯ���ϱ� ���� �迭
		int prev[SIZE]; // �ش��带 �湮�ϱ� ������ ��� ��ȣ�� �����ϴ� �迭

		for (int i = 0; i < SIZE; i++) //�迭 �ʱ�ȭ
		{
			dist[i] = INT_MAX;
			visit[i] = false;
			prev[i] = -1;
		}
		dist[start_n] = 0; // ���۳�带 �ʱ�ȭ
		for (int count = 0; count < SIZE - 1; count++) // ����� �� -1��ŭ �ݺ�
		{
			int min = INT_MAX; // 
			int min_index;
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && min > dist[v])//��尡 �湮�����ʾҰ� �ش���� ���۳�尣�� �Ÿ��� min���� ������
				{
					min_index = v; //�ε��� ����
					min = dist[v]; //�̴ϸغ��� ����
				}
			}
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && map[min_index][v] && dist[min_index] != INT_MAX&&dist[v] > dist[min_index] + map[min_index][v])//�ش��尡 �湮�����ʰ�, 
																																//������ ������ �����ؾ��ϰ�, ���۳��� �ش�񱳳������� �Ÿ��� ������Ʈ �Ǿ����� 
				{
					dist[v] = dist[min_index] + map[min_index][v];//�ִܰŸ� ������Ʈ
					prev[v] = min_index;//�ش��� ������带 prev�迭�� ����
				}
			}
			visit[min_index] = true; //�湮���� ó����.
		}
		printf("\n����� : ");
		int temp = dstn_n;//���������� ����ȣ �ӽ�����
		int i = 0;
		while (temp != -1) //prev��带 �������� ����ϱ����� stack�� ����
		{
			stack[i] = prev[temp]; //���ÿ� ����
			temp = prev[temp];//temp�� �� index�� prev������ ����
			i++;
		}
		i--;
		while (i != -1)//stack���� pop�ϴ� ������� ���.
		{
			switch (stack[i])
			{
			case 0:
				printf("�м��� �� ");
				i--;
				break;
			case 1:
				printf("��ȭ�� �� ");
				i--;
				break;
			case 2:
				printf("��ȸ���а� �� ");
				i--;
				break;
			case 3:
				printf("�濵�� �� ");
				i--;
				break;
			case 4:
				printf("�ڹ��� �� ");
				i--;
				break;
			case 5:
				printf("��ȭ�� �� ");
				i--;
				break;
			case 6:
				printf("���а� �� ");
				i--;
				break;
			case 7:
				printf("���ذ� �� ");
				i--;
				break;
			case 8:
				printf("����� �� ");
				i--;
				break;
			case 9:
				printf("������ �� ");
				i--;
				break;
			case 10:
				printf("���а� �� ");
				i--;
				break;
			case 11:
				printf("��Ͽ� �� ");
				i--;
				break;
			case 12:
				printf("�߾ӵ����� �� ");
				i--;
				break;
			case 13:
				printf("���� �� ");
				i--;
				break;
			case 14:
				printf("�Ű��а� �� ");
				i--;
				break;
			case 15:
				printf("����� �� ");
				i--;
				break;
			case 16:
				printf("������ȭ�� �� ");
				i--;
				break;
			case 17:
				printf("�л�ȸ�� �� ");
				i--;
				break;
			case 18:
				printf("����B �� ");
				i--;
				break;
			case 19:
				printf("�ݰ��� �� ");
				i--;
				break;
			case 20:
				printf("ü���� �� ");
				i--;
				break;
			case 21:
				printf("�и��� �� ");
				i--;
				break;
			case 22:
				printf("����A �� ");
				i--;
				break;
			case -1:
				i--;
				break;
			}
		}
		printf("%s\n", dstn_building_name); //���������� ���
		printf("\n���̵��ð��� �� %d���Դϴ�.\n", dist[dstn_n]);

	}
	for (int i = 0; i < m.rows; i++) {
		free(map[i]);
	}
	free(map);
}