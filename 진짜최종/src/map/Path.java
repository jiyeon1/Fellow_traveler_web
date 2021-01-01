package map;

import java.util.ArrayList;

public class Path {
   int size;
   int map[][];
   int[] stack= {-1,};
   
   public Path(int size) {
      this.size=size;
      map=new int[size][size];
      stack=new int[size];
   }
   

   public void input(int i,int j,int w){//�����ķ�, ����� �׷���
        map[i][j] = w;
        map[j][i] = w;
    }

   public ArrayList<String> dijkstra(int b1, int b2){
      int dist[]=new int[size];
      boolean[] visit=new boolean[size];
      int prev[]=new int[size];
      ArrayList<String> list=new ArrayList<String>();
      
      for(int i=0;i<size;i++)
      {
         dist[i]=Integer.MAX_VALUE;
         visit[i]=false;
         prev[i]=-1;
      }
      dist[b1]=0;
      for(int count=0;count<size-1;count++)
      {
         int min=Integer.MAX_VALUE;
         int min_index = 0;
         for(int v=0;v<size;v++)
         {
            if(!visit[v] && min > dist[v])
            {
               min_index=v;
               min=dist[v];
            }
         }
         for(int v=0;v<size;v++){
                if(!visit[v] && map[min_index][v]!=0){
                    if(dist[v]>dist[min_index]+map[min_index][v]){
                        dist[v] = dist[min_index]+map[min_index][v];
                        prev[v]=min_index;
                    }
                }
            }
         visit[min_index]=true;
      }
      int temp=b2;
      int i=0;
      while(temp != -1) {
         stack[i]=prev[temp];
         temp=prev[temp];
         i++;
      }
      i--;
      while(i!=-1)
      {
         switch(stack[i])
         {
         case 0:
            list.add("�м���");
            i--;
            break;
         case 1:
            list.add("��ȭ��");
            i--;
            break;
         case 2:
            list.add("��ȸ���а�");
            i--;
            break;
         
         case 3:
            list.add("�濵��");
            i--;
            break;
         
         case 4:
            list.add("�ڹ���");
            i--;
            break;
         case 5:
            list.add("��ȭ��");
            i--;
            break;
         case 6:
            list.add("���а�");
            i--;
            break;
         case 7:
            list.add("���ذ�");
            i--;
            break;
         case 8:
            list.add("�����");
            i--;
            break;
         case 9:
            list.add("������");
            i--;
            break;
         case 10:
            list.add("���а�");
            i--;
            break;
         case 11:
            list.add("��Ͽ�");
            i--;
            break;
         case 12:
            list.add("�߾ӵ�����");
            i--;
            break;
         case 13:
            list.add("����");
            i--;
            break;
         case 14:
            list.add("�Ű��а�");
            i--;
            break;
         case 15:
            list.add("�����");
            i--;
            break;
         case 16:
            list.add("������ȭ��");
            i--;
            break;
         case 17:
            list.add("�л�ȸ��");
            i--;
            break;
         case 18:
            list.add("����B");
            i--;
            break;
         case 19:
            list.add("�ݰ���");
            i--;
            break;
         case 20:
            list.add("ü����");
            i--;
            break;
         case 21:
            list.add("�и���");
            i--;
            break;
         case 22:
            list.add("����A");
            i--;
            break;
         case -1:
            i--;
            break;   
         }
      }
      return(list);
   }
}