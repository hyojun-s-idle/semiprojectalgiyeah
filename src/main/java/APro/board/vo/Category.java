package APro.board.vo;

public class Category {
	
	private int categoryNo;
	private String categoryName;
	private int prCategoryNo;
	
	public Category() {
	}
	
	
	public Category(int categoryNo, String categoryName, int prCategoryNo) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.prCategoryNo = prCategoryNo;
	}


	// getter /setter
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getPrCategoryNo() {
		return prCategoryNo;
	}
	public void setPrCategoryNo(int prCategoryNo) {
		this.prCategoryNo = prCategoryNo;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", prCategoryNo="
				+ prCategoryNo + "]";
	}
	

}
