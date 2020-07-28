package com.dto;

public class RamDto {

		private int ramNum;
		private String name;
		private int price;
		private String pic;
		private int amount;
		
		public RamDto() {
			super();
		}

		public RamDto(int ramNum, String name, int price, String pic, int amount) {
			super();
			this.ramNum = ramNum;
			this.name = name;
			this.price = price;
			this.pic = pic;
			this.amount = amount;
		}

		public int getRamNum() {
			return ramNum;
		}

		public void setRamNum(int ramNum) {
			this.ramNum = ramNum;
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

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}
}
