package com.mycompany.ebookstore.entities;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bId;
	private String bName;
	private String bAuthor;
	@Column(columnDefinition = "text")
	private String bDesc;
	private String bLanguage;
	private String bPhoto;
	private int bPrice;
	private int bDiscount;
	private int bQuantity;
	@ManyToOne
	private Category category;

	public Book() {
		super();
	}

	public Book(String bName, String bAuthor, String bDesc, String bLanguage, String bPhoto, int bPrice,
			int bDiscount, int bQuantity, Category category) {
		super();
		this.bName = bName;
		this.bAuthor = bAuthor;
		this.bDesc = bDesc;
		this.bLanguage = bLanguage;
		this.bPhoto = bPhoto;
		this.bPrice = bPrice;
		this.bDiscount = bDiscount;
		this.bQuantity = bQuantity;
		this.category = category;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbAuthor() {
		return bAuthor;
	}

	public void setbAuthor(String bAuthor) {
		this.bAuthor = bAuthor;
	}

	public String getbDesc() {
		return bDesc;
	}

	public void setbDesc(String bDesc) {
		this.bDesc = bDesc;
	}

	public String getbLanguage() {
		return bLanguage;
	}

	public void setbLanguage(String bLanguage) {
		this.bLanguage = bLanguage;
	}

	public String getbPhoto() {
		return bPhoto;
	}

	public void setbPhoto(String bPhoto) {
		this.bPhoto = bPhoto;
	}

	public int getbPrice() {
		return bPrice;
	}

	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}

	public int getbDiscount() {
		return bDiscount;
	}

	public void setbDiscount(int bDiscount) {
		this.bDiscount = bDiscount;
	}

	public int getbQuantity() {
		return bQuantity;
	}

	public void setbQuantity(int bQuantity) {
		this.bQuantity = bQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Book{" + "bId=" + bId + ", bName=" + bName + ",bLanguage=" + bLanguage
				+ ", bAuthor=" + bAuthor + ", bDesc=" + bDesc + ", bPhoto=" + bPhoto + ", bPrice=" + bPrice
				+ ", bDiscount=" + bDiscount + ", bQuantity=" + bQuantity + '}';
	}

	// calculate price after discount
	public int getPriceAfterApplyingDiscount() {
		int a=this.getbPrice();
		int b = (int) ((a / 100.0) * this.getbPrice());
		int c=a-b;
		return c;

	}

}
