package Dessert;

public class DessertVO {
	
	private int dIndex; //디저트 고유번호 
	private String dName; //디저트 이름 
	private String dImg; //이미지 
	private String dChara; //디저트 특징

	
	public DessertVO(int dIndex, String dName, String dImg, String dChara) {
		this.dIndex = dIndex;
		this.dName = dName;
		this.dImg = dImg;
		this.dChara =dChara;
	}


	public int getdIndex() {
		return dIndex;
	}


	public void setdIndex(int dIndex) {
		this.dIndex = dIndex;
	}


	public String getdName() {
		return dName;
	}


	public void setdName(String dName) {
		this.dName = dName;
	}


	public String getdImg() {
		return dImg;
	}


	public void setdImg(String dImg) {
		this.dImg = dImg;
	}


	public String getdChara() {
		return dChara;
	}


	public void setdChara(String dChara) {
		this.dChara = dChara;
	}


}