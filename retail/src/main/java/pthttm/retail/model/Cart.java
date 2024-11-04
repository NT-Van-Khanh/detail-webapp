package pthttm.retail.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        for(CartItem cartItem:items){
            if(cartItem.getProductId().equals(item.getProductId())){
                cartItem.setQuantity(cartItem.getQuantity()+item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(String productId) {
        items.removeIf(item -> item.getProductId().equals(productId));
    }

    public Long getGrandTotal() {
        double sum = items.stream()
                .mapToDouble(CartItem::getTotalAmount)
                .sum();
        return Math.round(sum);
    }
}
