package pthttm.retail.model;

import java.io.InputStream;

public class ImageProduct {
    private String id;
    private InputStream image;

    public ImageProduct() {
    }

    public ImageProduct(String id, InputStream image) {
        this.id = id;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }
}
