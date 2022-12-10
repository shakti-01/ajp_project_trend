package dao;

public class Product {
	private String name, seller;
	private float price, rating;
	
	public String getName() { return name;}
	public String getSeller() {return seller;}
	public float getPrice() {return price;}
	public float getRating() {return rating;}
	
	public void setName(String n) {name =n;}
	public void setSeller(String s) {seller=s;}
	public void setPrice(float p) {price=p;}
	public void setRating(float r) {rating =r;}
}
