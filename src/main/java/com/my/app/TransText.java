package com.my.app;

public class TransText {
	public String whatPart(String part) {
		String return_str="";
		if(part.equals("Pectoral")) {return_str="대흉근 (가슴)";}
		else if(part.equals("Deltoid")) {return_str="삼각근 (어깨)";}
		else if(part.equals("Abs")) {return_str="복근 (복부)";}
		else if(part.equals("Arms")) {return_str="상완이두근 & 상완삼두근 (팔)";}
		else if(part.equals("Latissimus_Dorsi_Muscle")) {return_str="광배근 (등)";}
		else if(part.equals("Quadriceps")) {return_str="대퇴근 (다리앞면)";}
		else if(part.equals("Hamstring")) {return_str="슬굴곡근 (다리뒷면)";}
		else if(part.equals("Gluteus_Maximus")) {return_str="대둔근 (엉덩이)";}
		
		return return_str;
	}
}
