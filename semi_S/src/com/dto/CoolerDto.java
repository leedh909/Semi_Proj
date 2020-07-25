package com.dto;

public class CoolerDto {
		private int coolNum;
		private String name;
		private int price;
		private String pic;
		
		public CoolerDto() {
			super();
		}

		public CoolerDto(int coolNum, String name, int price, String pic) {
			super();
			this.coolNum = coolNum;
			this.name = name;
			this.price = price;
			this.pic = pic;
		}

		public int getCoolNum() {
			return coolNum;
		}

		public void setCoolNum(int coolNum) {
			this.coolNum = coolNum;
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