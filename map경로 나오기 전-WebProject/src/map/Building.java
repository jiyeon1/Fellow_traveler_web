package map;

public class Building {
	private String b;
	
	public String Building(String b){
        this.b = b; 
        switch(b) {
        case "1": b="�м���"; break;
        case "2": b="��ȭ��"; break;
        case "3": b="��ȸ���а�"; break;
        case "4": b="�濵��"; break;
        case "5": b="�ڹ���"; break;
        case "6": b="��ȭ��"; break;
        case "7": b="���а�"; break;
        case "8": b="���ذ�"; break;
        case "9": b="�����"; break;
        case "10": b="������"; break;
        case "11": b="���а�"; break;
        case "12": b="��Ͽ�"; break;
        case "13": b="�߾ӵ�����"; break;
        case "14": b="����"; break;
        case "15": b="�Ű��а�"; break;
        case "16": b="�����"; break;
        case "17": b="������ȭ��"; break;
        case "18": b="�л�ȸ��"; break;
        case "19": b="����B"; break;
        case "20": b="�ݰ���"; break;
        case "21": b="ü����"; break;
        case "22": b="�и���"; break;
        case "23": b="����A"; break;

        }
        return b;
    }
	
}
