package pthttm.retail.model;
public class CartItem {
	private String productId;
	private String name;
	private Double price;
	private Integer quantity;

	public CartItem(String productId, String name, Double price, Integer quantity) {
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public CartItem() {
		this.price = 0.0;
	}

	public double getTotalAmount() {
		return price * quantity;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


}