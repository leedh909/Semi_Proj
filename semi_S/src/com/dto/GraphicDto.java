package com.dto;

public class GraphicDto {
	
		private int graphicNum;
		private String name;
		private int price;
		private String pic;
		
		public GraphicDto() {
			super();
		}

		public GraphicDto(int graphicNum, String name, int price, String pic) {
			super();
			this.graphicNum = graphicNum;
			this.name = name;
			this.price = price;
			this.pic = pic;
		}

		public int getGraphicNum() {
			return graphicNum;
		}

		public void setGraphicNum(int graphicNum) {
			this.graphicNum = graphicNum;
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

