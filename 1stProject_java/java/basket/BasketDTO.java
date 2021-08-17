package basket;
public class BasketDTO {
	String ProductId; // 상품
//	int basketId; // 키
	int Amount; // 개수
	String ProductName; // 상품명
	String userId; // 사용자Id
	int ProductPrice; // 가격
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}
	@Override
	public String toString() {
		return "BasketDTO [ProductId=" + ProductId + ", Amount=" + Amount + ", ProductName=" + ProductName + ", userId="
				+ userId + ", ProductPrice=" + ProductPrice + "]";
	}
	
	
	
}