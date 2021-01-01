#include "project.h"
#include <Windows.h>

int ask_quit() {  //끝낼 지 다시 탐색할 지 결정
	int quit;

	while (1) {
		printf("\n▶다시 탐색하겠습니까? [ 네(0) , 아니오(1) ] ☞ "); //네 : 다시탐색  아니오 : 종료
		scanf("%d", &quit);
		if (quit == 0) {  //네
			system("cls");
			printf("\n<캠퍼스 내 최단경로를 탐색합니다>......\n");
			printMap();
			break;
		}
		else if (quit == 1) {  //아니오
			printf("\n");
			break;
		}
		else {
			printf("\n잘못된 입력입니다.\n");
		}
	}
	return quit;
}
