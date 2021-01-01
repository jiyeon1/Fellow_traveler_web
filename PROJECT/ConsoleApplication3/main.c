#include "project.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int *num; //�ǹ���ȣ
	int *arr; //���ǹ�ȣ
	int btw, n, std, ch;
	char **building;

	num = (int*)malloc(sizeof(int) * 10);
	arr = (int*)malloc(sizeof(int) * 10);

	building = (char*)malloc(sizeof(char) * 10);
	for (int i = 0; i < 10; i++) {
		building[i] = (char*)malloc(sizeof(char) * 20);
	}

	printf("\n  <ķ�۽� �� �ִܰ�θ� Ž���մϴ�>......\n");
	printMap();
	while (1) {
		int count = 0;//��Ž���� �� �ð�ǥ �ʱ�ȭ�ǵ��� while(1)�ȿ�
		int x = 0;
		printf("\n�����л�(0)   �ܺ���(1)   ����(2) : ");
		scanf("%d", &std);
		if (std == 0) { //���л�
			printf("\n���ð�ǥ �Է�(0)   ��� Ž��(1) : ");
			scanf("%d", &ch);
			if (ch == 0) {  //�ð�ǥ�Է�
				subject();  //���� ���
				while (1) {
					printf("��%d���� ���� ��ȣ : ", count + 1);
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
						printf("     �� %d��° �����ð��� ��� ������ �Է��ϼ��� : ", ++x);
						scanf_s("%d", &btw);
						num[i] = btw;
						if (num[i] == 0) strcpy(building[i], "�м���");
						else if (num[i] == 1) strcpy(building[i], "��ȭ��");
						else if (num[i] == 2) strcpy(building[i], "��ȸ��ȭ��");
						else if (num[i] == 3) strcpy(building[i], "�濵��");
						else if (num[i] == 4) strcpy(building[i], "�ڹ���");
						else if (num[i] == 5) strcpy(building[i], "��ȭ��");
						else if (num[i] == 6) strcpy(building[i], "���а�");
						else if (num[i] == 7) strcpy(building[i], "���ذ�");
						else if (num[i] == 8) strcpy(building[i], "�����");
						else if (num[i] == 9) strcpy(building[i], "������");
						else if (num[i] == 10) strcpy(building[i], "���а�");
						else if (num[i] == 11) strcpy(building[i], "��Ͽ�");
						else if (num[i] == 12) strcpy(building[i], "�߾ӵ�����");
						else if (num[i] == 13) strcpy(building[i], "����");
						else if (num[i] == 14) strcpy(building[i], "�Ű��а�");
						else if (num[i] == 15) strcpy(building[i], "�����");
						else if (num[i] == 16) strcpy(building[i], "������ȭ��");
						else if (num[i] == 17) strcpy(building[i], "�л�ȸ��");
						else if (num[i] == 18) strcpy(building[i], "����B");
						else if (num[i] == 19) strcpy(building[i], "�ݰ���");
						else if (num[i] == 20) strcpy(building[i], "ü����");
						else if (num[i] == 21) strcpy(building[i], "�и���");
						else if (num[i] == 22) strcpy(building[i], "����A");
						break;
					case 1: case 2: case 3:
						num[i] = 1;
						strcpy(building[i], "��ȭ��"); break;
					case 4:	case 5:
						num[i] = 5;
						strcpy(building[i], "��ȭ��"); break;
					case 6:	case 7:	case 8:
						num[i] = 21;
						strcpy(building[i], "�и���"); break;
					case 9: case 10: case 11:
						num[i] = 14;
						strcpy(building[i], "�Ű��а�"); break;
					case 12:
						num[i] = 15;
						strcpy(building[i], "�����"); break;
					case 13: case 14:
						num[i] = 16;
						strcpy(building[i], "������ȭ��"); break;
					case 15: case 16:
						num[i] = 9;
						strcpy(building[i], "������"); break;
					case 17: 
						num[i] = 6;
						strcpy(building[i], "���а�"); break;
					case 18:
						num[i] = 7;
						strcpy(building[i], "���ذ�"); break;
					}
				}
				printf("\n�ؿ��� �̵��ϴ� ��� �� �̵� �ð��Դϴ�.\n");

				for (int i = 0; i < count; i++) {
					if (i == count - 1)
						break;
					printf("\n��%d���� [ %s ]     ---��     %d���� [ %s ]\n", i + 1, building[i], i + 2, building[i + 1]);
					schedule_search(num[i], num[i + 1], building[i], building[i + 1]); //��� Ž��
					printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
				}
				if (ask_quit() == 1) {
					break;
				}

			}
			else if (ch == 1) {  //��� Ž��
				search();
				if (ask_quit() == 1)
					break;
			}
			else
				printf("\n�߸��� �Է��Դϴ�.\n�ٽ� �Է��ϼ���\n");
		}
		else if (std == 1) {  //�ܺ���
			search();    //���Ž��
			if (ask_quit() == 1) 
				break;
		}
		else if (std == 2) 
			break; //����
		else
			printf("\n�߸��� �Է��Դϴ�.\n�ٽ� �Է��ϼ���\n");

	}
	free(arr);
	free(num);
	for (int i = 0; i < 10; i++) {
		free(building[i]);
	}
	free(building);
	return 0;
}
