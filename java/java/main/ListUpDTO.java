package main;

public class ListUpDTO {
	private String productNum;
	private String productPic;
	private String productName;
	private int  productPrice;
	private String productWeight;
	private String productOrigin;
	
	
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductWeight() {
		return productWeight;
	}
	public void setProductWeight(String productWeight) {
		this.productWeight = productWeight;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	
	
	@Override
	public String toString() {
		return "ListUpDTO [productNum=" + productNum + ", productPic=" + productPic + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productWeight=" + productWeight + ", productOrigin="
				+ productOrigin + "]";
	}
	

}
