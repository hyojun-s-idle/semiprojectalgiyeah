package APro.board.vo;

public class SearchBoard {
	
	private String conSearch;
	private int mSearchMember;
	private int allSearch;
	private int businessSearch;
	private int rectalSearch;
	private String nSearch;
	
	public SearchBoard() {}

	public SearchBoard(String conSearch, int mSearchMember, int allSearch, int businessSearch, int rectalSearch,
			String nSearch) {
		super();
		this.conSearch = conSearch;
		this.mSearchMember = mSearchMember;
		this.allSearch = allSearch;
		this.businessSearch = businessSearch;
		this.rectalSearch = rectalSearch;
		this.nSearch = nSearch;
	}

	public String getConSearch() {
		return conSearch;
	}

	public void setConSearch(String conSearch) {
		this.conSearch = conSearch;
	}

	public int getmSearchMember() {
		return mSearchMember;
	}

	public void setmSearchMember(int mSearchMember) {
		this.mSearchMember = mSearchMember;
	}

	public int getAllSearch() {
		return allSearch;
	}

	public void setAllSearch(int allSearch) {
		this.allSearch = allSearch;
	}

	public int getBusinessSearch() {
		return businessSearch;
	}

	public void setBusinessSearch(int businessSearch) {
		this.businessSearch = businessSearch;
	}

	public int getRectalSearch() {
		return rectalSearch;
	}

	public void setRectalSearch(int rectalSearch) {
		this.rectalSearch = rectalSearch;
	}

	public String getnSearch() {
		return nSearch;
	}

	public void setnSearch(String nSearch) {
		this.nSearch = nSearch;
	}
	
}
