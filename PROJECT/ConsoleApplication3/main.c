#include "project.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int *num; //건물번호
	int *arr; //강의번호
	int btw, n, std, ch;
	char **building;

	num = (int*)malloc(sizeof(int) * 10);
	arr = (int*)malloc(sizeof(int) * 10);

	building = (char*)malloc(sizeof(char) * 10);
	for (int i = 0; i < 10; i++) {
		building[i] = (char*)malloc(sizeof(char) * 20);
	}

	printf("\n  <캠퍼스 내 최단경로를 탐색합니다>......\n");
	printMap();
	while (1) {
		int count = 0;//재탐색할 때 시간표 초기화되도록 while(1)안에
		int x = 0;
		printf("\n▶재학생(0)   외부인(1)   종료(2) : ");
		scanf("%d", &std);
		if (std == 0) { //재학생
			printf("\n▶시간표 입력(0)   경로 탐색(1) : ");
			scanf("%d", &ch);
			if (ch == 0) {  //시간표입력
				subject();  //과목 출력
				while (1) {
					printf("▷%d교시 강의 번호 : ", count + 1);
					scanf("%d", &n);
					if (n == -1)
						break;
					arr[count] = n;
					count++;
				}

				for (int i = 0; i < count; i++) {
					switch (arr[i]) {
					case 0:
						show_buildingnum();
						printf("     ▷ %d번째 공강시간에 어디 있을지 입력하세요 : ", ++x);
						scanf_s("%d", &btw);
						num[i] = btw;
						if (num[i] == 0) strcpy(building[i], "학술관");
						else if (num[i] == 1) strcpy(building[i], "문화관");
						else if (num[i] == 2) strcpy(building[i], "사회문화관");
						else if (num[i] == 3) strcpy(building[i], "경영관");
						else if (num[i] == 4) strcpy(building[i], "박물관");
						else if (num[i] == 5) strcpy(building[i], "혜화관");
						else if (num[i] == 6) strcpy(building[i], "법학관");
						else if (num[i] == 7) strcpy(building[i], "만해관");
						else if (num[i] == 8) strcpy(building[i], "다향관");
						else if (num[i] == 9) strcpy(building[i], "명진관");
						else if (num[i] == 10) strcpy(building[i], "과학관");
						else if (num[i] == 11) strcpy(building[i], "상록원");
						else if (num[i] == 12) strcpy(building[i], "중앙도서관");
						else if (num[i] == 13) strcpy(building[i], "본관");
						else if (num[i] == 14) strcpy(building[i], "신공학관");
						else if (num[i] == 15) strcpy(building[i], "원흥관");
						else if (num[i] == 16) strcpy(building[i], "정보문화관");
						else if (num[i] == 17) strcpy(building[i], "학생회관");
						else if (num[i] == 18) strcpy(building[i], "계산관B");
						else if (num[i] == 19) strcpy(building[i], "금강관");
						else if (num[i] == 20) strcpy(building[i], "체육관");
						else if (num[i] == 21) strcpy(building[i], "학림관");
						else if (num[i] == 22) strcpy(building[i], "계산관A");
						break;
					case 1: case 2: case 3:
						num[i] = 1;
						strcpy(building[i], "문화관"); break;
					case 4:	case 5:
						num[i] = 5;
						strcpy(building[i], "혜화관"); break;
					case 6:	case 7:	case 8:
						num[i] = 21;
						strcpy(building[i], "학림관"); break;
					case 9: case 10: case 11:
						num[i] = 14;
						strcpy(building[i], "신공학관"); break;
					case 12:
						num[i] = 15;
						strcpy(building[i], "원흥관"); break;
					case 13: case 14:
						num[i] = 16;
						strcpy(building[i], "정보문화관"); break;
					case 15: case 16:
						num[i] = 9;
						strcpy(building[i], "명진관"); break;
					case 17: 
						num[i] = 6;
						strcpy(building[i], "법학관"); break;
					case 18:
						num[i] = 7;
						strcpy(building[i], "만해관"); break;
					}
				}
				printf("\n※오늘 이동하는 경로 및 이동 시간입니다.\n");

				for (int i = 0; i < count; i++) {
					if (i == count - 1)
						break;
					printf("\n▶%d교시 [ %s ]     ---→     %d교시 [ %s ]\n", i + 1, building[i], i + 2, building[i + 1]);
					schedule_search(num[i], num[i + 1], building[i], building[i + 1]); //경로 탐색
					printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
				}
				if (ask_quit() == 1) {
					break;
				}

			}
			else if (ch == 1) {  //경로 탐색
				search();
				if (ask_quit() == 1)
					break;
			}
			else
				printf("\n잘못된 입력입니다.\n다시 입력하세요\n");
		}
		else if (std == 1) {  //외부인
			search();    //경로탐색
			if (ask_quit() == 1) 
				break;
		}
		else if (std == 2) 
			break; //종료
		else
			printf("\n잘못된 입력입니다.\n다시 입력하세요\n");

	}
	free(arr);
	free(num);
	for (int i = 0; i < 10; i++) {
		free(building[i]);
	}
	free(building);
	return 0;
}
