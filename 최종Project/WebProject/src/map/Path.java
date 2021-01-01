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
   

   public void input(int i,int j,int w){//희소행렬로, 양방향 그래프
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
            list.add("학술관");
            i--;
            break;
         case 1:
            list.add("문화관");
            i--;
            break;
         case 2:
            list.add("사회과학관");
            i--;
            break;
         
         case 3:
            list.add("경영관");
            i--;
            break;
         
         case 4:
            list.add("박물관");
            i--;
            break;
         case 5:
            list.add("혜화관");
            i--;
            break;
         case 6:
            list.add("법학관");
            i--;
            break;
         case 7:
            list.add("만해관");
            i--;
            break;
         case 8:
            list.add("다향관");
            i--;
            break;
         case 9:
            list.add("명진관");
            i--;
            break;
         case 10:
            list.add("과학관");
            i--;
            break;
         case 11:
            list.add("상록원");
            i--;
            break;
         case 12:
            list.add("중앙도서관");
            i--;
            break;
         case 13:
            list.add("본관");
            i--;
            break;
         case 14:
            list.add("신공학관");
            i--;
            break;
         case 15:
            list.add("원흥관");
            i--;
            break;
         case 16:
            list.add("정보문화관");
            i--;
            break;
         case 17:
            list.add("학생회관");
            i--;
            break;
         case 18:
            list.add("계산관B");
            i--;
            break;
         case 19:
            list.add("금강관");
            i--;
            break;
         case 20:
            list.add("체육관");
            i--;
            break;
         case 21:
            list.add("학림관");
            i--;
            break;
         case 22:
            list.add("계산관A");
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