#include "project.h"
#include <Windows.h>

int ask_quit() {  //���� �� �ٽ� Ž���� �� ����
	int quit;

	while (1) {
		printf("\n���ٽ� Ž���ϰڽ��ϱ�? [ ��(0) , �ƴϿ�(1) ] �� "); //�� : �ٽ�Ž��  �ƴϿ� : ����
		scanf("%d", &quit);
		if (quit == 0) {  //��
			system("cls");
			printf("\n<ķ�۽� �� �ִܰ�θ� Ž���մϴ�>......\n");
			printMap();
			break;
		}
		else if (quit == 1) {  //�ƴϿ�
			printf("\n");
			break;
		}
		else {
			printf("\n�߸��� �Է��Դϴ�.\n");
		}
	}
	return quit;
}
