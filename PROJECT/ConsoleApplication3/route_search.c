#include "project.h"
#include <stdlib.h>
#include <stdio.h>
#define SIZE 23  //크기

typedef struct Matrix {
	int row, col, value;
}Matrix;
typedef struct SP_Matrix {
	int rows, cols, terms;
	Matrix data[75];
}Sprsmtrx;


void search() {   //경로탐색
	int sel = 1; //메뉴 입력 변수
	int start_n, dstn_n; // 출발,목적 노드 번호
	int stack[23] = { -1, }; //경로 추적을 위한 stack
	char start_s[20], dstn_s[20]; //출발,목적지 이름 변수
	//희소행렬

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
	int **map;//일반행렬
	//이차원배열 동적할당 
	map = (int**)calloc(m.rows, sizeof(int*));
	for (int i = 0; i < m.rows; i++)
	{
		map[i] = (int*)calloc(m.cols, sizeof(int));
	}
	//일반행렬에 희소행렬대입
	for (int i = 0; i < m.terms; i++)
	{
		map[m.data[i].row][m.data[i].col] = m.data[i].value;
	}
	//양방향 그래프를 위한 반복문
	for (int i = 0; i < SIZE; i++) { 
		for (int j = i + 1; j < SIZE; j++) {
			map[j][i] = map[i][j];
		}
	}

	while (1) {
		printf("\n▶현재위치한 건물이름 입력 ☞ ");
		scanf("%s", &start_s); //출발지 입력 
							   // 출발건물 이름 문자열을 해당노드의 정수형으로 변환
		if (!strcmp(start_s, "학술관")) { start_n = 0; }
		else if (!strcmp(start_s, "문화관")) { start_n = 1; }
		else if (!strcmp(start_s, "사회과학관")) { start_n = 2; }
		else if (!strcmp(start_s, "경영관")) { start_n = 3; }
		else if (!strcmp(start_s, "박물관")) { start_n = 4; }
		else if (!strcmp(start_s, "혜화관")) { start_n = 5; }
		else if (!strcmp(start_s, "법학관")) { start_n = 6; }
		else if (!strcmp(start_s, "만해관")) { start_n = 7; }
		else if (!strcmp(start_s, "다향관")) { start_n = 8; }
		else if (!strcmp(start_s, "명진관")) { start_n = 9; }
		else if (!strcmp(start_s, "과학관")) { start_n = 10; }
		else if (!strcmp(start_s, "상록원")) { start_n = 11; }
		else if (!strcmp(start_s, "중앙도서관")) { start_n = 12; }
		else if (!strcmp(start_s, "본관")) { start_n = 13; }
		else if (!strcmp(start_s, "신공학관")) { start_n = 14; }
		else if (!strcmp(start_s, "원흥관")) { start_n = 15; }
		else if (!strcmp(start_s, "정보문화관")) { start_n = 16; }
		else if (!strcmp(start_s, "학생회관")) { start_n = 17; }
		else if (!strcmp(start_s, "계산관B")) { start_n = 18; }
		else if (!strcmp(start_s, "금강관")) { start_n = 19; }
		else if (!strcmp(start_s, "체육관")) { start_n = 20; }
		else if (!strcmp(start_s, "학림관")) { start_n = 21; }
		else if (!strcmp(start_s, "계산관A")) { start_n = 22; }
		else //건물명을 잘못 입력 했을 경우 다시 입력 받음
		{
			start_n = -1;
			printf("\n※ 출발지를 잘못 입력하셨습니다.\n");
			continue;
		}
		break;
	}
	while (1) {
		printf("\n▶목적 건물이름 입력 ☞ ");
		scanf("%s", &dstn_s);  //목적지 입력 
							   // 목적지 건물이름 문자열을 해당노드의 정수형으로 변환
		if (!strcmp(dstn_s, "학술관")) { dstn_n = 0; }
		else if (!strcmp(dstn_s, "문화관")) { dstn_n = 1; }
		else if (!strcmp(dstn_s, "사회과학관")) { dstn_n = 2; }
		else if (!strcmp(dstn_s, "경영관")) { dstn_n = 3; }
		else if (!strcmp(dstn_s, "박물관")) { dstn_n = 4; }
		else if (!strcmp(dstn_s, "혜화관")) { dstn_n = 5; }
		else if (!strcmp(dstn_s, "법학관")) { dstn_n = 6; }
		else if (!strcmp(dstn_s, "만해관")) { dstn_n = 7; }
		else if (!strcmp(dstn_s, "다향관")) { dstn_n = 8; }
		else if (!strcmp(dstn_s, "명진관")) { dstn_n = 9; }
		else if (!strcmp(dstn_s, "과학관")) { dstn_n = 10; }
		else if (!strcmp(dstn_s, "상록원")) { dstn_n = 11; }
		else if (!strcmp(dstn_s, "중앙도서관")) { dstn_n = 12; }
		else if (!strcmp(dstn_s, "본관")) { dstn_n = 13; }
		else if (!strcmp(dstn_s, "신공학관")) { dstn_n = 14; }
		else if (!strcmp(dstn_s, "원흥관")) { dstn_n = 15; }
		else if (!strcmp(dstn_s, "정보문화관")) { dstn_n = 16; }
		else if (!strcmp(dstn_s, "학생회관")) { dstn_n = 17; }
		else if (!strcmp(dstn_s, "계산관B")) { dstn_n = 18; }
		else if (!strcmp(dstn_s, "금강관")) { dstn_n = 19; }
		else if (!strcmp(dstn_s, "체육관")) { dstn_n = 20; }
		else if (!strcmp(dstn_s, "학림관")) { dstn_n = 21; }
		else if (!strcmp(dstn_s, "계산관A")) { dstn_n = 22; }
		else //건물명을 잘못 입력 했을 경우 다시 입력 받음
		{
			dstn_n = -1;
			printf("\n※ 목적지를 잘못 입력하셨습니다.\n");
			continue;
		}
		break;
	}

	if (start_n != -1 && dstn_n != -1) // 출발지와 목적지를 입력 받으면 알고리즘 시작
	{
		int dist[SIZE]; //건물과 건물 사이의 거리 초기화
		bool visit[SIZE];//방문된 건물인지 확인하기 위한 배열
		int prev[SIZE]; // 해당건물을 방문하기 직전의 건물 번호를 저장하는 배열


		for (int i = 0; i < SIZE; i++) //배열 초기화
		{
			dist[i] = INT_MAX;//출발점을 제외한 모든 노드들은 아직 방문하지 않았기 때문에 d[다른노드]=무한(최대 정수)
			visit[i] = false;
			prev[i] = -1;
		}
		dist[start_n] = 0; // 출발점을 초기화

						   //최단거리 입력
		for (int count = 0; count < SIZE - 1; count++) // 0~22 -> 23
		{
			int min = INT_MAX;
			int min_index;
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && min > dist[v])//노드가 방문되지않았고 해당노드와 시작노드간의 거리가 min보다 작을때
				{
					min_index = v; //인덱스 변경
					min = dist[v]; //미니멈변수 변경
				}
			}
			//최단거리 업데이트
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && map[min_index][v] && dist[min_index] != INT_MAX && dist[v] > dist[min_index] + map[min_index][v])
					//해당노드가 방문되지않고, 
					//노드사이 간선이 존재해야하고, 시작노드와 해당비교노드사이의 거리가 업데이트 되어있음 
				{
					dist[v] = dist[min_index] + map[min_index][v];
					prev[v] = min_index;//해당노드 직전노드를 prev배열에 저장
				}
			}
			visit[min_index] = true; //방문으로 처리함.
		}


		printf("\n▶%s부터 %s까지의 시간은 약 %d초입니다.\n", start_s, dstn_s, dist[dstn_n]);
		printf("\n▶경로 : ");
		int temp = dstn_n;//최종목적지 노드번호 임시저장
		int i = 0;
		while (temp != -1) //prev노드를 역순으로 출력하기위해 stack에 저장
		{
			stack[i] = prev[temp]; //스택에 저장
			temp = prev[temp];//temp를 전 index의 prev값으로 변경
			i++;
		}
		i--;
		while (i != -1)//stack에서 pop하는 순서대로 출력.
		{
			switch (stack[i])
			{
			case 0:
				printf("학술관 → ");
				i--;
				break;
			case 1: printf("문화관 → ");
				i--;
				break;
			case 2:
				printf("사회과학관 → ");
				i--;
				break;
			case 3:
				printf("경영관 → ");
				i--;
				break;
			case 4:
				printf("박물관 → ");
				i--;
				break;
			case 5:
				printf("혜화관 → ");
				i--;
				break;
			case 6:
				printf("법학관 → ");
				i--;
				break;
			case 7:
				printf("만해관 → ");
				i--;
				break;
			case 8:
				printf("다향관 → ");
				i--;
				break;
			case 9:
				printf("명진관 → ");
				i--;
				break;
			case 10:
				printf("과학관 → ");
				i--;
				break;
			case 11:
				printf("상록원 → ");
				i--;
				break;
			case 12:
				printf("중앙도서관 → ");
				i--;
				break;
			case 13:
				printf("본관 → ");
				i--;
				break;
			case 14:
				printf("신공학관 → ");
				i--;
				break;
			case 15:
				printf("원흥관 → ");
				i--;
				break;
			case 16:
				printf("정보문화관 → ");
				i--;
				break;
			case 17:
				printf("학생회관 → ");
				i--;
				break;
			case 18:
				printf("계산관B → ");
				i--;
				break;
			case 19:
				printf("금강관 → ");
				i--;
				break;
			case 20:
				printf("체육관 → ");
				i--;
				break;
			case 21:
				printf("학림관 → ");
				i--;
				break;
			case 22:
				printf("계산관A → ");
				i--;
				break;
			case -1:
				i--;
				break;
			}
		}
		printf("%s\n", dstn_s); //최종목적지 출력
	}
	for (int i = 0; i < m.rows; i++) {
		free(map[i]);
	}
	free(map);
}
void schedule_search(int start_n, int dstn_n, char* start_building_name, char* dstn_building_name) {  //시간표에 따른 경로 탐색
																									  //출발, 목적 노드 번호 받음
	int sel = 1; //메뉴 입력 변수
	int stack[23] = { -1, }; //경로 추적을 위한 stack
							 //char start_building_name[20], dstn_building_name[20]; //출발,목적지 이름 변수
	//희소행렬
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
	int **map;//일반행렬
	//이차원배열 동적할당 
	map = (int**)calloc(m.rows, sizeof(int*));//23행
	for (int i = 0; i < m.rows; i++)//23열
	{
		map[i] = (int*)calloc(m.cols, sizeof(int));
	}
	//일반행렬에 희소행렬대입
	for (int i = 0; i < m.terms; i++)
	{
		map[m.data[i].row][m.data[i].col] = m.data[i].value;
	}
	//양방향 그래프를 위한 반복문
	for (int i = 0; i < SIZE; i++) { 
		for (int j = i + 1; j < SIZE; j++) {
			map[j][i] = map[i][j];
		}
	}

	if (start_n != -1 && dstn_n != -1) // 출발지와 목적지를 입력 받으면 알고리즘 시작
	{
		int dist[SIZE]; //시작노드와 각 노드간의 최소거리를 업데이트하기 위한 배열
		bool visit[SIZE];//방문된 노드인지 확인하기 위한 배열
		int prev[SIZE]; // 해당노드를 방문하기 직전의 노드 번호를 저장하는 배열

		for (int i = 0; i < SIZE; i++) //배열 초기화
		{
			dist[i] = INT_MAX;
			visit[i] = false;
			prev[i] = -1;
		}
		dist[start_n] = 0; // 시작노드를 초기화
		for (int count = 0; count < SIZE - 1; count++) // 노드의 수 -1만큼 반복
		{
			int min = INT_MAX; // 
			int min_index;
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && min > dist[v])//노드가 방문되지않았고 해당노드와 시작노드간의 거리가 min보다 작을때
				{
					min_index = v; //인덱스 변경
					min = dist[v]; //미니멈변수 변경
				}
			}
			for (int v = 0; v < SIZE; v++)
			{
				if (!visit[v] && map[min_index][v] && dist[min_index] != INT_MAX&&dist[v] > dist[min_index] + map[min_index][v])//해당노드가 방문되지않고, 
																																//노드사이 간선이 존재해야하고, 시작노드와 해당비교노드사이의 거리가 업데이트 되어있음 
				{
					dist[v] = dist[min_index] + map[min_index][v];//최단거리 업데이트
					prev[v] = min_index;//해당노드 직전노드를 prev배열에 저장
				}
			}
			visit[min_index] = true; //방문으로 처리함.
		}
		printf("\n▶경로 : ");
		int temp = dstn_n;//최종목적지 노드번호 임시저장
		int i = 0;
		while (temp != -1) //prev노드를 역순으로 출력하기위해 stack에 저장
		{
			stack[i] = prev[temp]; //스택에 저장
			temp = prev[temp];//temp를 전 index의 prev값으로 변경
			i++;
		}
		i--;
		while (i != -1)//stack에서 pop하는 순서대로 출력.
		{
			switch (stack[i])
			{
			case 0:
				printf("학술관 → ");
				i--;
				break;
			case 1:
				printf("문화관 → ");
				i--;
				break;
			case 2:
				printf("사회과학관 → ");
				i--;
				break;
			case 3:
				printf("경영관 → ");
				i--;
				break;
			case 4:
				printf("박물관 → ");
				i--;
				break;
			case 5:
				printf("혜화관 → ");
				i--;
				break;
			case 6:
				printf("법학관 → ");
				i--;
				break;
			case 7:
				printf("만해관 → ");
				i--;
				break;
			case 8:
				printf("다향관 → ");
				i--;
				break;
			case 9:
				printf("명진관 → ");
				i--;
				break;
			case 10:
				printf("과학관 → ");
				i--;
				break;
			case 11:
				printf("상록원 → ");
				i--;
				break;
			case 12:
				printf("중앙도서관 → ");
				i--;
				break;
			case 13:
				printf("본관 → ");
				i--;
				break;
			case 14:
				printf("신공학관 → ");
				i--;
				break;
			case 15:
				printf("원흥관 → ");
				i--;
				break;
			case 16:
				printf("정보문화관 → ");
				i--;
				break;
			case 17:
				printf("학생회관 → ");
				i--;
				break;
			case 18:
				printf("계산관B → ");
				i--;
				break;
			case 19:
				printf("금강관 → ");
				i--;
				break;
			case 20:
				printf("체육관 → ");
				i--;
				break;
			case 21:
				printf("학림관 → ");
				i--;
				break;
			case 22:
				printf("계산관A → ");
				i--;
				break;
			case -1:
				i--;
				break;
			}
		}
		printf("%s\n", dstn_building_name); //최종목적지 출력
		printf("\n▶이동시간은 약 %d초입니다.\n", dist[dstn_n]);

	}
	for (int i = 0; i < m.rows; i++) {
		free(map[i]);
	}
	free(map);
}