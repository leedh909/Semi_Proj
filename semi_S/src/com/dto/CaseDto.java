package com.dto;

public class CaseDto {

		private int caseNum;

		private String name;
		private int price;
		private String pic;
		
		public CaseDto() {
			super();
		}

		public CaseDto(int caseNum, String name, int price, String pic) {
			super();
			this.caseNum = caseNum;
			this.name = name;
			this.price = price;
			this.pic = pic;
		}

		public int getCaseNum() {
			return caseNum;
		}

		public void setCaseNum(int caseNum) {
			this.caseNum = caseNum;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String getPic() {
			return pic;
		}

		public void setPic(String pic) {
			this.pic = pic;
		}
		
		
		
}
