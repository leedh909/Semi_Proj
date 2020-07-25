package com.dto;

public class MainboardDto {

		private int mbNum;
		private String name;
		private int price;
		private String pic;
		
		public MainboardDto() {
			super();
		}

		public MainboardDto(int mbNum, String name, int price, String pic) {
			super();
			this.mbNum = mbNum;
			this.name = name;
			this.price = price;
			this.pic = pic;
		}

		public int getMbNum() {
			return mbNum;
		}

		public void setMbNum(int mbNum) {
			this.mbNum = mbNum;
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
