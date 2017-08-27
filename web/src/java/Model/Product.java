/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author hhumo
 */
@Entity(name = "Product")
public class Product {
    
    @Id
    private long productID;
    @ManyToOne
    @JoinColumn(name = "categoryID")
    private Category category;
    private String productName;
    private String productImage;
    private String productPrice;
    private String productDescription;
    private long productSeatNumbers;
    private String productColor;
    private String productFuel;
    private String productModel;
    private long productYear;

    public Product() {
    }

    public Product(long productID, Category category, String productName, String productImage, String productPrice, String productDescription, long productSeatNumbers, String productColor, String productFuel, String productModel, long productYear) {
        this.productID = productID;
        this.category = category;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.productSeatNumbers = productSeatNumbers;
        this.productColor = productColor;
        this.productFuel = productFuel;
        this.productModel = productModel;
        this.productYear = productYear;
    }

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public long getProductSeatNumbers() {
        return productSeatNumbers;
    }

    public void setProductSeatNumbers(long productSeatNumbers) {
        this.productSeatNumbers = productSeatNumbers;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductFuel() {
        return productFuel;
    }

    public void setProductFuel(String productFuel) {
        this.productFuel = productFuel;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public long getProductYear() {
        return productYear;
    }

    public void setProductYear(long productYear) {
        this.productYear = productYear;
    }
    
    
    
}
