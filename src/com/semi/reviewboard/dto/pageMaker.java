package com.semi.reviewboard.dto;

public class pageMaker {
	//페이징 계산하는 클레스
	private int totalcount;//전체 게시물 개수
	private int pagenum;//현재 페이지 번호
	private int contentnum;//한 페이지에 몇 개 표시할지
	private int startPage;//현재 페이지 블록의 시작페이지
	private int endPage;//현재 페이지 블록의 마지막 페이지	
	private boolean prev;//이전 페이지로가는 화살표: 처음 게시판은 1번부터시작이라 보이면 안되니까 초기값 false
	private boolean next;//다음 페이지로 가는 화살표
	private int currentblock;//현재 페이지 블록
	private int lastblock;//마지막 페이지 블록
	private int startrow; //페이지의 최 상위줄
	private int endrow; //페이지의 최 하위줄
	

	//전체 페이지수를 계산하는 함수
	public int calcpage(int totalcount, int contentnum) {
		int totalpage = totalcount/contentnum;
		if(totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int currentblock) {
		//시작페이지는 블록을 가지고 구할 수 있음 
		this.startPage = (currentblock*5)-4;
	//[1] 1 2 3 4 5
	//[2] 6 7 8 9 10
	//[3] 11 12 13
	//[1][2][3] == pageblockNum		
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastblock, int getcurrentblock) {
		
		if(getlastblock==getcurrentblock) {
			this.endPage = calcpage(getTotalcount(), getContentnum());
		}else {
			//5페이지씩 나오기때문에 블록의 첫페이지숫자+4 = 마지막페이지숫자
			this.endPage = getStartPage()+4;
		}
		
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentblock() {
		return currentblock;
	}
	public void setCurrentblock(int pagenum) {
		//페이지 번호를 통해서 구한다 
		//페이지 번호/ 페이지 그룹안의 페이지 개수
		//1p : 1/5 = 0.2
		// int형이기때문에 0.2=>0
		// 1%5 = 나머지가 0 이상이기때문에 0+1
		//따라서 1p의 페이지블록 = 1
		this.currentblock = pagenum/5;
		if(pagenum%5>0) {
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	public void setLastblock(int totalcount) {
	//10개씩 게시글을 가져오고있고 블록당 5페이지 => 한 블록당 50개 게시글
		this.lastblock = totalcount/(this.contentnum*5);
		if(totalcount%(this.contentnum*5)>0) {
			this.lastblock++;
			
		}
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int getPagenum, int getContentnum) {
		this.startrow = (getPagenum*getContentnum)-(getContentnum-1);
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int getPagenum, int getContentnum) {
		this.endrow = getPagenum*getContentnum;
	}



	
	


}
