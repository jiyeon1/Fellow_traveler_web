package map;

public class Building {
	private String b;
	
	public String Building(String b){
        this.b = b; 
        switch(b) {
        case "1": b="학술관"; break;
        case "2": b="문화관"; break;
        case "3": b="사회과학관"; break;
        case "4": b="경영관"; break;
        case "5": b="박물관"; break;
        case "6": b="혜화관"; break;
        case "7": b="법학관"; break;
        case "8": b="만해관"; break;
        case "9": b="다향관"; break;
        case "10": b="명진관"; break;
        case "11": b="과학관"; break;
        case "12": b="상록원"; break;
        case "13": b="중앙도서관"; break;
        case "14": b="본관"; break;
        case "15": b="신공학관"; break;
        case "16": b="원흥관"; break;
        case "17": b="정보문화관"; break;
        case "18": b="학생회관"; break;
        case "19": b="계산관B"; break;
        case "20": b="금강관"; break;
        case "21": b="체육관"; break;
        case "22": b="학림관"; break;
        case "23": b="계산관A"; break;

        }
        return b;
    }
	
}
